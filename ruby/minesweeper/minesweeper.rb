class Board
  ADJACENT = [
    [1, 0], [0, 1], [-1, 0], [0, -1],
    [1, 1], [-1, -1], [1, -1], [-1, 1]
  ].freeze

  def self.transform(board)
    Board.new(board).transform
  end

  def initialize(mines)
    # Remove top/bottom border lines, then convert to
    # internal representation
    board = mines[1..-2].map(&method(:as_booleans))
    fail ValueError unless valid?(board)

    @board = board
    @max_x = @board.length
    @max_y = @board[0].length
  end

  def transform
    counted_rows = @board.each_with_index.map do |row, x|
      # Prefer each_with_object to string reduction as insert
      # mutates the original string :(
      row.each_with_object('||').with_index do |(has_mine, a), y|
        a.insert(-2, has_mine ? '*' : neighbor_count(x, y).to_s)
      end
    end
    [border] + counted_rows + [border]
  end

  private

  # Represent mine/not-mine with a boolean, removing borders.
  # '| * * |' -> [false, true, false, true, false]
  def as_booleans(row)
    fail ValueError unless row =~ /\A\|[ *]+\|\z/
    row[1..-2].each_char.map { |c| c == '*' }
  end

  def lookup(x, y)
    return false if x < 0 || x >= @max_x
    return false if y < 0 || y >= @max_y
    @board[x][y]
  end

  def neighbor_count(x, y)
    mine_count = ADJACENT.count do |dx, dy|
      lookup(x + dx, y + dy)
    end
    mine_count <= 0 ? ' ' : mine_count
  end

  # Generate top/bottom border of the form +-----+
  def border
    '+' + ('-' * @max_y) + '+'
  end

  def valid?(board)
    board.map(&:length).uniq.length == 1
  end
end

class ValueError < StandardError; end
