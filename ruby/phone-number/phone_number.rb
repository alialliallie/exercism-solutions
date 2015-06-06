class PhoneNumber
  BAD = '0' * 10
  PARTS = /^(\d{3})(\d{3})(\d{4})/

  def initialize(number)
    @original = number
    @clean = @original.gsub(/\D/,'')
  end

  def number
    return BAD if @original.match(/[^0-9 ().-]/)
    return BAD if too_short
    return BAD if too_long
    return BAD unless right_format

    # This is the last ten characters to implicitly strip
    # the starting 1
    @clean[-10,10]
  end

  def area_code
    number[0,3]
  end

  def to_s
    _, area, prefix, rest = PARTS.match(number).to_a
    "(#{area}) #{prefix}-#{rest}"
  end

  private

  def too_short
    @clean.length < 10
  end

  def too_long
    @clean.length > 11
  end

  def right_format
    @clean.length == 10 || @clean.start_with?('1')
  end
end
