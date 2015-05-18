class Fixnum
  ROMAN_NUMERALS = [
    [1, 'I'], [4, 'IV'], [5, 'V'], [9, 'IX'],
    [10, 'X'], [40, 'XL'], [50, 'L'], [90, 'XC'],
    [100, 'C'], [400, 'CD'], [500, 'D'], [900, 'CM'],
    [1000, 'M']
  ].reverse

  def to_roman
    n = self
    ROMAN_NUMERALS.reduce('') do |o, pair|
      div, mod = n.divmod(pair[0])
      n = mod
      o << pair[1] * div
    end
  end
end
