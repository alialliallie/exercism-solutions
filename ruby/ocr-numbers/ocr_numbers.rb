class OCR
  def initialize(input)
    @input = input
  end

  def convert
    @input.split("\n").each_slice(4).map { |l| parse(l) }.join(',')
  end

  private

  def parse(lines)
    num_chars = (lines[0].length / 3) - 1
    rows = lines.map { |l| l.chars.each_slice(3).map(&:join) }
    chars = (0..num_chars).map { |i| rows.map { |r| r[i] } }
    chars.map(&:join).map { |c| digit(c) }.join
  end

  def digit(n)
    clean = n.gsub("\n", '').chomp
    (CHARS.index(clean) || '?').to_s
  end

  CHARS = [
    ' _ | ||_|   ', # 0
    '     |  |   ', # 1
    ' _  _||_    ', # 2
    ' _  _| _|   ', # 3
    '   |_|  |   ', # 4
    ' _ |_  _|   ', # 5
    ' _ |_ |_|   ', # 6
    ' _   |  |   ', # 7
    ' _ |_||_|   ', # 8
    ' _ |_| _|   ', # 9
  ]

  attr_accessor :input
end
