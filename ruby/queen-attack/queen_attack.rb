class Queens
  attr_reader :white, :black

  def initialize(positions = {})
    @white = positions[:white] || [0, 3]
    @black = positions[:black] || [7, 3]
    fail ArgumentError if white == black
  end

  def to_s
    0.upto(7).each_with_object([]) do |row, out|
      out << line(row)
    end.join("\n")
  end

  def attack?
    same_row = white[0] == black[0]
    same_col = white[1] == black[1]
    same_diagonal = (white[0] - black[0]).abs == (white[1] - black[1]).abs
    same_col || same_row || same_diagonal
  end

  private

  def line(row)
    0.upto(7).each_with_object([]) do |col, out|
      if [row, col] == white
        out << 'W'
      elsif [row, col] == black
        out << 'B'
      else
        out << '_'
      end
    end.join(' ')
  end
end
