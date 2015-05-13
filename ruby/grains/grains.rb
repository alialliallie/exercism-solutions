module Grains
  def self.square(n)
    2 ** (n-1)
  end

  def self.total
    (1..64).reduce(0) do |sum, square|
      sum = sum + Grains.square(square)
    end
  end
end
