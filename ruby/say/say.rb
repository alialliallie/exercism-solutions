class Say
  UNITS = %w(zero one two three four five six seven eight nine ten eleven twelve
             thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  TENS = %w(_ _ twenty thirty forty fifty sixty seventy eighty ninety)
  MAGNITUDE = %w(_ thousand million billion)

  def initialize(number)
    fail ArgumentError if number < 0 || number >= 1_000_000_000_000
    @number = number
  end

  def in_english
    return UNITS[0] if @number == 0
    out = []
    chunkify(@number).each_with_index do |chunk, idx|
      next if chunk == 0
      out << MAGNITUDE[idx] unless idx == 0
      out << textify(chunk)
    end
    out.reverse.join(' ')
  end

  private

  # Turn a large number into 3-digit chunks
  def chunkify(number)
    chunks = []
    while number > 0
      number, chunk = number.divmod(1000)
      chunks << chunk
    end
    chunks
  end

  # turn a number into text 0-999
  def textify(number)
    return UNITS[number] if number < UNITS.length

    tens, units = number.divmod(10)
    hundreds, tens = tens.divmod(10)

    out = ''
    out << "#{UNITS[hundreds]} hundred " if hundreds > 0
    out << "#{TENS[tens]}" if tens > 0 && number >= 20
    out << "-" if tens > 0 && units > 0
    out << "#{UNITS[units]}" if units > 0
    out.strip
  end
end
