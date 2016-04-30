module RunLengthEncoding
  VERSION = 1

  def self.encode(input)
    input
      .each_char
      .slice_when { |a, b| a != b }
      .reduce('') { |a, e| a << compact(e) }
  end

  CODE_REGEX = /(\d*)(\D)/
  def self.decode(input)
    input
      .scan(CODE_REGEX)
      .reduce('') { |a, e| a << expand(e) }
  end

  def self.compact(run)
    if run.length == 1
      run.first
    else
      "#{run.length}#{run.first}"
    end
  end

  def self.expand((num, char))
    char * (num == '' ? 1 : num.to_i)
  end
end
