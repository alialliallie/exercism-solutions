module RunLengthEncoding
  VERSION = 1

  def self.encode(input)
    input
      .chars
      .slice_when { |a, b| a != b }
      .flat_map(&method(:run_to_pair))
      .join
  end

  CODE_REGEX = /(\d*)(\D)/
  def self.decode(input)
    input
      .scan(CODE_REGEX)
      .map(&method(:pair_to_run))
      .join
  end

  def self.run_to_pair(run)
    if run.length == 1
      [run[0]]
    else
      [run.length, run[0]]
    end
  end

  def self.pair_to_run((i, c))
    len = i == '' ? 1 : i.to_i
    c * len
  end
end
