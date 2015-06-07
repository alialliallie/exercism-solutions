require 'prime'

module PrimeFactors
  def self.for(n)
    factorize(n, [])
  end

  private

  def self.factorize(n, factors)
    return factors if n == 1

    factor = primes_to(n).detect { |p| n % p == 0 }
    factorize(n / factor, factors + [factor])
  end

  def self.primes_to(n)
    primes = Prime.each
    primes.upper_bound = n
    primes
  end
end
