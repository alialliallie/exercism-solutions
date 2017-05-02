import scala.collection.mutable
import scala.util.Random

object Robot {
  private val nameHistory = mutable.Set[String]()

  private def uniqueName(): RobotName = {
    var name = RobotName.genName()
    while (nameHistory.contains(name.toString())) {
      name = name.increment()
    }
    nameHistory += name.toString()
    name
  }

}

class Robot {
  var internalName: RobotName = Robot.uniqueName()
  def name(): String = internalName.toString()
  def reset(): Unit = this.internalName = Robot.uniqueName()
}

object RobotName {
  private val alphabet:Vector[Char] = "ABCDEFGHIJKLMNOPQRSTUVQXYZ".toVector
  private val prefixList = alphabet.map(a1 => alphabet.map(a2 => Seq(a1, a2).mkString(""))).flatten

  val MAX_PREFIX = prefixList.size
  val MAX_SUFFIX = 1000

  def genName(): RobotName = {
    val prefix = Random.nextInt(MAX_PREFIX)
    val suffix = Random.nextInt(MAX_SUFFIX)
    RobotName(prefix, suffix)
  }
}

case class RobotName(prefix: Int, suffix: Int) {

  override def toString(): String = {
    val p = RobotName.prefixList(prefix)
    f"$p%s$suffix%03d"
  }

  def increment(): RobotName = {
    val newSuffix = (suffix + 1) % RobotName.MAX_SUFFIX
    // Handle rollovers
    val newPrefix = if (newSuffix == 0) {
      (prefix + 1) % RobotName.MAX_PREFIX
    } else {
      prefix
    }
    RobotName(newPrefix, newSuffix)
  }
}
