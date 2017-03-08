module Hamming
  def self.compute(left, right)
    raise(ArgumentError.new) unless left.size == right.size
    left.chars.zip(right.chars).count { |l, r| l != r }
  end
end
