class Sieve
  def initialize(n)
    @max = n
    @marks = Array.new(@max, false)
  end

  def primes
    2.upto(@max).each_with_object([]) do |i, primes|
      next if @marks[i]

      primes << i
      mark(i)
    end
  end

  private

  def mark(x)
    x.step(@max, x) { |i| @marks[i] = true }
  end
end
