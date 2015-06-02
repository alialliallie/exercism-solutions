class Binary
  def initialize(binary_string)
    @binary = binary_string
  end

  def to_decimal
    return 0 if @binary.match(/[^01]/)
    @binary.chars.reverse.each_with_index
           .reduce(0) do |sum, (bit, place)|
             sum + 2**place.to_i * bit.to_i
           end
  end
end
