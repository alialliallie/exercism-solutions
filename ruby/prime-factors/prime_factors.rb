require 'prime'

module PrimeFactors
  def self.for(n)
    return [] if n == 1

    primes = Prime.each
    primes.upper_bound = n
    factors = []
    prime = primes.next

    begin
      div, mod = n.divmod(prime)
      if mod == 0
        factors << prime
        n = div
      else
        prime = primes.next
      end
    end while n > 1
    factors
  end
end
