class Prime
  def nth(prime_count)
    raise ArgumentError if prime_count == 0
    primes = [2]

    # start with 3, already covered primes less than this w/ priming
    odds = Enumerator.new do |yielder|
      n = 3 
      loop do
        yielder.yield n
        n = n + 2
      end
    end

    odds.lazy.take_while { primes.length < prime_count }.each do |i|
      has_factor = primes.any? do |p|
        (i % p) == 0
      end
      primes << i unless has_factor
    end
    primes[prime_count - 1]
  end
end
