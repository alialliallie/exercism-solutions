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
end
