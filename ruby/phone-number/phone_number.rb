class PhoneNumber
  BAD = '0' * 10

  def initialize(number)
    @original = number
  end

  def number
    clean = @original.gsub(/\D/,'')
    return BAD if @original.match(/[a-zA-Z]/)
    return BAD if clean.length < 10
    return clean[1,10] if clean.length == 11 && clean.start_with?('1')
    return BAD if clean.length > 10
    clean
  end

  def area_code
    number[0,3]
  end

  def to_s
    _, area, prefix, rest = /^(\d{3})(\d{3})(\d{4})/.match(number).to_a
    "(#{area}) #{prefix}-#{rest}"
  end
end
