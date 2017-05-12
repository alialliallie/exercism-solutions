case class Robot(bearing: Bearing, coordinates: (Int, Int)) {
  private def x = coordinates._1
  private def y = coordinates._2

  def advance: Robot = bearing match {
    case Bearing.North => Robot(bearing, (x, y + 1))
    case Bearing.South => Robot(bearing, (x, y - 1))
    case Bearing.East => Robot(bearing, (x + 1, y))
    case Bearing.West => Robot(bearing, (x - 1, y))
  }

  def turnRight: Robot = bearing match {
    case Bearing.North => Robot(Bearing.East, coordinates)
    case Bearing.East => Robot(Bearing.South, coordinates)
    case Bearing.South => Robot(Bearing.West, coordinates)
    case Bearing.West => Robot(Bearing.North, coordinates)
  }

  def turnLeft: Robot = bearing match {
    case Bearing.North => Robot(Bearing.West, coordinates)
    case Bearing.East => Robot(Bearing.North, coordinates)
    case Bearing.South => Robot(Bearing.East, coordinates)
    case Bearing.West => Robot(Bearing.South, coordinates)
  }

  def simulate(orders: String): Robot =
    orders.foldLeft(this)((robot, op) =>
      op match {
        case 'R' => robot.turnRight
        case 'L' => robot.turnLeft
        case 'A' => robot.advance
      }
    )
}

sealed abstract class Bearing
object Bearing {
  case object North extends Bearing
  case object South extends Bearing
  case object East extends Bearing
  case object West extends Bearing
}
