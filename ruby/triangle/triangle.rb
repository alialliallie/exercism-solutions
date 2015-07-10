class Triangle
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    fail TriangleError unless x > 0 && y > 0 && z > 0
    fail TriangleError unless x + y > z && y + z > x && z + x > y
    @x = x
    @y = y
    @z = z
  end

  def kind
    return :equilateral if x == y && y == z
    return :isosceles if x == y || y == z || x == z
    :scalene
  end
end

class TriangleError < StandardError; end
