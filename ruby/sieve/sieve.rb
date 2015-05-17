class Sieve
  def initialize(n)
    @max = n
    @marks = Array.new(@max, false)
  end

  def primes
    primes = []
    2.upto(@max).each do |i|
      next if @marks[i]

      primes << i
      mark(i)
    end
    primes
  end

  private
  def mark(x)
    x.step(@max, x).each do |i|
      @marks[i] = true
    end
  end
end
