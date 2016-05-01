module RunLengthEncoding
  VERSION = 1

  def self.encode(input)
    input
      .each_char
      .slice_when(&:!=)
      .reduce('') { |a, e| a << compact(e) }
  end

  def self.decode(input)
    input
      .scan(/(\d*)(\D)/)
      .reduce('') { |a, (num, char)| a << expand(num, char) }
  end

  def self.compact(run)
    "#{run.length if run.length > 1}#{run.first}"
  end

  def self.expand(num, char)
    char * (num == '' ? 1 : num.to_i)
  end
end
