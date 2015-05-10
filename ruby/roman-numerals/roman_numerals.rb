class Fixnum
  NUMERALS = %w(I V X L C D M)
  VALUES = [1, 5, 10, 50, 100, 500, 1000]
  VALMAP = Hash[*VALUES.zip(NUMERALS).flatten]

  MAGNITUDES = [1000, 100, 10]

  def to_roman
    out = ""
    remainder = MAGNITUDES.reduce(self) do |memo, mag|
      out << find_numeral(memo, mag) 
      memo - (memo / mag * mag)
    end
    out << digit_to_numeral(remainder, 1) if remainder > 0
    out
  end

  private
  def find_numeral(number, magnitude)
    digit = number / magnitude
    digit == 0 ? "" : digit_to_numeral(digit, magnitude)
  end

  def digit_to_numeral(d, m)
    numeral = VALMAP[m]
    next_numeral = VALMAP[m*5]
    case d
    when 1, 2, 3
      numeral * d
    when 4
      numeral + next_numeral
    when 5
      next_numeral
    when 6, 7, 8
      next_numeral + (numeral * (d-5))
    when 9
      numeral + VALMAP[m * 10]
    end
  end
end
