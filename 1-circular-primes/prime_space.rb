require 'prime'
module PrimeSpace
  extend self

  @strategy = 'default'

  def strategy
    @strategy
  end

  def strategy=(new_strategy)
    @strategy = new_strategy
  end

  def circular_primes_below(input)
    execute_strategy(:circular_primes_below, input)
  end

  def primes_below(input)
    execute_strategy(:primes_below, input)
  end
  
  protected

  def execute_strategy(method, input)
    case @strategy
    when 'default'
      return PrimesTrialDivisionStrategy.send(method, input)
    when 'eratosthenes'
      return PrimesEratosthenesStrategy.send(method, input)
    else
      raise 'Unknown prime strategy specified'
    end
  end
end

module PrimesTrialDivisionStrategy
  include PrimeSpace
  extend self

  def circular_primes_below(input)
    find_primespace_below(input)[:minimum_value_circular_primes]
  end

  def primes_below(input)
    find_primespace_below(input)[:primes]
  end

  def circular_prime?(p)
    individual_numbers = "#{p}".chars
    number_of_rotations = individual_numbers.length
    included_primes = []
  
    number_of_rotations.times do
      working_chars = individual_numbers
      rotated_number = working_chars.join.to_i
      included_primes << rotated_number
      is_also_prime = rotated_number.prime?
  
      return false, [] if !is_also_prime
  
      individual_numbers = working_chars.rotate
    end
    return true, included_primes.uniq.sort
  end

  private

  def find_primespace_below(input)
    input = input.abs

    all_primes = (1...input).select(&:prime?)
    overlapping_primes = []
    all_circular_primes = all_primes.select do |p| 
      bool, included_primes = self.circular_prime?(p)
      overlapping_primes << included_primes if bool
      bool
    end
    minimum_value_circular_primes = overlapping_primes.uniq.map(&:first)

    {
      primes: all_primes,
      circular_primes: all_circular_primes,
      minimum_value_circular_primes: minimum_value_circular_primes,
    }
  end
end

require 'prime'

module PrimesEratosthenesStrategy
  include PrimeSpace
  extend self

  def circular_primes_below(input)
    s = find_primespace_below(input)
    s.values.compact.uniq
  end

  def primes_below(input)
    s = find_primespace_below(input)
    s.keys
  end

  private

  def find_primespace_below(input)
    input = input.abs
    sieve = Array.new(input, true)
    sieve[0] = sieve[1] = false # 0 and 1 are not prime numbers

    (2...Math.sqrt(input).to_i + 1).each do |i|
      if sieve[i]
        (i * i...input).step(i) { |j| sieve[j] = false }
      end
    end

    prime_space = {}
    sieve.each_with_index do |is_prime, i|
      next unless is_prime
      is_circular_prime, lowest_prime = minimum_circular_prime(i)
      prime_space[i] = is_circular_prime ? lowest_prime : nil
    end

    prime_space
  end

  def minimum_circular_prime(i)
    # i is already identified as prime.
    # rotate through the values
    # check that all are primes (true)
    # return [cicular_prime?, min_prime]
    individual_numbers = i.to_s.chars
    number_of_rotations = individual_numbers.length - 1
    initial_value = i
    min_value = i

    number_of_rotations.times do
      rotated_number = individual_numbers.rotate!.join.to_i
      is_also_prime = rotated_number.prime?

      return [false, initial_value] unless is_also_prime

      min_value = rotated_number if rotated_number < min_value
    end
    [true, min_value]
  end
end
