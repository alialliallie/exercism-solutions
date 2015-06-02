class SumOfMultiples
  def self.to(limit)
    self.new(3, 5).to(limit)
  end

  def initialize(*args)
    @factors = args
  end

  def to(limit)
    1.upto(limit - 1).find_all { |n| factorable(n) }
                     .reduce(0) { |a, e| a + e }
  end

  private

  def factorable(n)
    @factors.any? { |f| n % f == 0 }
  end
end
