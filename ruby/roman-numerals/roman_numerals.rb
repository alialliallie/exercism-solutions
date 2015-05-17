class Fixnum
  ROMAN_NUMERALS = {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  def to_roman
    out = ""
    remainder = [1000, 100, 10].reduce(self) do |memo, mag|
      digit = memo / mag
      unless digit == 0
      out << roman_numeral_from_digit(digit, mag)
      end
      memo - (memo / mag * mag)
    end
    out << roman_numeral_from_digit(remainder, 1) if remainder > 0
    out
  end

  private
  def roman_numeral_from_digit(d, m)
    return ROMAN_NUMERALS[d*m] if ROMAN_NUMERALS[d*m]
    numeral = ROMAN_NUMERALS[m]
    next_numeral = ROMAN_NUMERALS[m*5]

    if d < 5
      numeral * d
    else
      next_numeral + (numeral * (d-5))
    end
  end
end
