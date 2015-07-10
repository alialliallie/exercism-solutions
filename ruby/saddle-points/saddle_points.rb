class Matrix
  def initialize(input)
    rows = input.split("\n")
    @matrix = rows.map do |r|
      r.split(' ').map(&:to_i)
    end
  end

  def rows
    @matrix
  end

  def columns
    0.upto(@matrix.length).map do |i|
      @matrix.map { |r| r[i] }
    end
  end

  def saddle_points
    col_min_points & row_max_points
  end

  private

  def row_max_points
    rows.each_with_index.flat_map do |r, i|
      max = r.max
      indexes = r.each_index.select { |idx| r[idx] == max }
      ([i] * indexes.length).zip(indexes)
    end
  end

  def col_min_points
    columns.each_with_index.flat_map do |c, i|
      min = c.min
      indexes = c.each_index.select { |idx| c[idx] == min }
      indexes.zip([i] * indexes.length)
    end
  end
end
