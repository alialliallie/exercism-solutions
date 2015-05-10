class Prime
  def nth(prime_count)
    raise ArgumentError if prime_count == 0
    primes = [2]

    odds.lazy.take_while { primes.length < prime_count }.each do |i|
      primes << i unless primes.any? { |p| (i % p) == 0 }
    end
    primes.last
  end

  private
  # start with 3, already covered primes less than this w/ priming
  def odds
    Enumerator.new do |yielder|
      n = 3 
      loop do
        yielder.yield n
        n = n + 2
      end
    end

  end
end
