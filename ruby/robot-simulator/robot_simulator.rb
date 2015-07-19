class Robot
  BEARINGS = [:north, :east, :south, :west]

  def orient(direction)
    fail ArgumentError unless BEARINGS.include?(direction)
    @bearing = direction
  end

  def turn_right
    orient BEARINGS[(BEARINGS.find_index(bearing) + 1) % BEARINGS.length]
  end

  def turn_left
    orient BEARINGS[(BEARINGS.find_index(bearing) - 1) % BEARINGS.length]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case bearing
    when :north
      at(coordinates[0], coordinates[1] + 1)
    when :east
      at(coordinates[0] + 1, coordinates[1])
    when :south
      at(coordinates[0], coordinates[1] - 1)
    when :west
      at(coordinates[0] - 1, coordinates[1])
    end
  end

  attr_reader :bearing, :coordinates
end

class Simulator
  INSTRUCTIONS = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }

  def instructions(list)
    list.chars.map { |i| INSTRUCTIONS[i] }
  end

  def place(robot, **opts)
    robot.orient opts[:direction]
    robot.at opts[:x], opts[:y]
  end

  def evaluate(robot, instructions)
    self.instructions(instructions).each { |i| robot.send(i) }
  end
end
