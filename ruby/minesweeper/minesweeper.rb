class Board
  def self.transform(board)
    Board.new(board).transform
  end

  ADJACENT = [
    [1, 0], [0, 1], [-1, 0], [0, -1],
    [1, 1], [-1, -1], [1, -1], [-1, 1]
  ]

  def initialize(mines)
    @board = mines.reject { |x| x.start_with? '+' }
                  .map { |x| to_mines(x) }
    fail ValueError unless valid?
    @max_x = @board.length
    @max_y = @board[0].length
  end

  def transform
    mapped = @board.each_with_index.map do |mr, x|
      row = mr.each_with_index.map do |mc, y|
        mc ? '*' : neighbors(x, y)
      end.join
      "|#{row}|"
    end
    [border] + mapped + [border]
  end

  def to_mines(row)
    fail ValueError unless row =~ /\|[ *0-9]+\|/
    row.chars.reject { |c| c == '|' }.map { |c| c == '*' }
  end

  def lookup(x, y)
    return false if x < 0 || x >= @max_x
    return false if y < 0 || y >= @max_y
    @board[x][y]
  end

  def neighbors(x, y)
    total = ADJACENT.reduce(0) do |mines, (dx, dy)|
      val = lookup(x + dx, y + dy)
      val ? mines + 1 : mines
    end
    total <= 0 ? ' ' : total
  end

  def border
    "+" + (0..(@board[0].length - 1)).map {|_| '-'}.join + "+"
  end

  def valid?
    @board.map(&:length).uniq.length == 1
  end
end

class ValueError < StandardError; end
