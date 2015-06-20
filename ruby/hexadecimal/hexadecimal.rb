class Hexadecimal
  HEX = { 'a' => 10, 'b' => 11, 'c' => 12,
          'd' => 13, 'e' => 14, 'f' => 15 }
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number.match(/[^0-9a-fA-F]/)
    digits = @number.chars.map do |c|
      HEX.fetch(c.downcase, c.to_i) 
    end
    with_index = digits.reverse.each_with_index
    with_index.reduce(0) do |value, (digit, power)|
      value + digit * (16**power)
    end
  end
end
