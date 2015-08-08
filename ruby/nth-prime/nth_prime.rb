class Prime
  def nth(prime_count)
    fail ArgumentError if prime_count == 0
    primes = [2]

    odds.lazy.take_while { primes.length < prime_count }.each do |i|
      primes << i unless existing(primes, i)
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
        n += 2
      end
    end
  end

  def existing(primes, i)
    root_i = Math.sqrt(i)
    primes.take_while { |p| p <= root_i }
      .any? { |p| (i % p) == 0 }
  end
end
