class Luhn
  attr_accessor :number

  def initialize(number)
    @number = number
    @digits = number.to_s.chars.map(&:to_i)
  end

  def addends
    @digits.reverse.each_with_index.map do |d, i|
      n = i.odd? ? (d * 2) : d
      n >= 10 ? n - 9 : n
    end.reverse
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    (0..10).each_with_object(number * 10)
      .map(&:+)
      .map(&Luhn.method(:new))
      .find(&:valid?).number
  end
end
