require 'pry'
require_relative 'prime_space'

input = ARGV[0].to_i

PrimeSpace.strategy = 'default'
circular_prime_default = PrimeSpace.circular_primes_below(input)
puts "Circular primes found using Trial Division looping strategy:\n#{circular_prime_default}"

PrimeSpace.strategy = 'eratosthenes'
circular_prime_erato = PrimeSpace.circular_primes_below(input)
puts "Circular primes found using the Sieve of Eratosthenes strategy:\n#{circular_prime_erato}"

puts "\n👉Answer: There are #{circular_prime_erato.count} circular primes below #{input}👈\n\n"


primes = (1...input).select(&:prime?)

for strategy in ['default', 'eratosthenes'] do
  PrimeSpace.strategy = strategy

  puts "\nValidating: #{strategy.upcase}"
  check = (primes == PrimeSpace.primes_below(input))
  puts "#{check ? "PASS" : "FAIL"}: Primes are correct"
  check = PrimeSpace.circular_primes_below(input) - primes == []
  puts "#{check ? "PASS" : "FAIL"}: Circular Primes are a subset of primes"
  check = PrimeSpace.circular_primes_below(input).map(&:prime?).uniq
  puts "#{check.count == 1 && check.first ? "PASS" : "FAIL"}: Circular primes are indeed prime"
end

exit unless ARGV[1] == '--ips'

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("Trial Division") do
    PrimeSpace.strategy = 'default'
    circular_prime_default = PrimeSpace.circular_primes_below(200_000)
  end
  x.report("Sieve of Eratosthenes") do
    PrimeSpace.strategy = 'eratosthenes'
    circular_prime_default = PrimeSpace.circular_primes_below(200_000)
  end

  x.compare!
end
