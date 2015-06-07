class Trinary
  def initialize(string)
    @digits = string.chars.map(&:to_i).reject { |d| d > 2 }
  end

  def to_decimal
    with_index = @digits.reverse.each_with_index
    with_index.reduce(0) do |value, (digit, power)|
      value += digit * (3 ** power)
    end
  end
end
