# Circular Primes Finder

This Ruby script finds circular primes below a given number using two different strategies: the Trial Division Strategy and the Sieve of Eratosthenes Strategy. Here's a quick rundown of how each approach works and their computational complexities.

## Approaches

### Trial Division Strategy
- **Method**: Iterates through each number up to the input limit, checking for primality using trial division.
- **Complexity**:
  - **Space**: \(O(n)\) – needs to store the list of primes.
  - **Time**: \(O(n \sqrt{n})\) – dominated by the primality check for each number.

### Sieve of Eratosthenes Strategy
- **Method**: Uses the Sieve of Eratosthenes to find all primes up to the input limit efficiently, then checks for circular primes.
- **Complexity**:
  - **Space**: \(O(n)\) – uses an array to mark prime numbers.
  - **Time**: \(O(n \log \log n)\) – efficient prime generation, followed by circular prime checks.

# Requirements
- ruby
- install packages using `$ bundle install`

## Running the Code

To run the code and see the performance comparison, use the following command:

```bash
ruby run.rb 1000 --ips ## --ips is optional
```

This will output the circular primes found by each strategy and their respective performance metrics.

## Example Output

When running the script with an input of 1000, both strategies correctly identify the same set of circular primes:

```
Circular primes found using Trial Division Strategy:
[2, 3, 5, 7, 11, 13, 17, 37, 79, 113, 197, 199, 337]

Circular primes found using the Sieve of Eratosthenes Strategy:
[2, 3, 5, 7, 11, 13, 17, 37, 79, 113, 197, 199, 337]

👉 Answer: There are 13 circular primes below 1000 👈
```

## Testing

For each strategy, some basic checks are in place to compare the results against the ruby Prime lib.

This was mainly used in development for checking the results.

```
Validating: DEFAULT
PASS: Primes are correct:
PASS: Circular Primes are a subset of primes
PASS: Circular primes are indeed prime

Validating: ERATOSTHENES
PASS: Primes are correct:
PASS: Circular Primes are a subset of primes
PASS: Circular primes are indeed prime
```

## Performance

The benchmarking results demonstrate the efficiency difference between the two strategies:

```
Warming up --------------------------------------
      Trial Division     1.000 i/100ms
Sieve of Eratosthenes
                         1.000 i/100ms
Calculating -------------------------------------
      Trial Division      7.367 (± 0.0%) i/s -     37.000 in   5.029223s
Sieve of Eratosthenes
                         17.618 (± 5.7%) i/s -     88.000 in   5.020280s

Comparison:
Sieve of Eratosthenes:       17.6 i/s
      Trial Division:        7.4 i/s - 2.39x  slower
```


## Findings

The Sieve of Eratosthenes Strategy is faster for finding circular primes, performing about 1.21 times faster than the Trial Division Strategy. This is consistent with the theoretical time complexities.

