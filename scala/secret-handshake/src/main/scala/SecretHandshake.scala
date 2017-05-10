import scala.util.Try

object SecretHandshake {
  val components = Map(
    0x1 -> "wink",
    0x2 -> "double blink",
    0x4 -> "close your eyes",
    0x8 -> "jump"
  )

  val reverseFlag = 0x10

  def handshake(code: Int): Seq[String] = {
    val actions = components.filterKeys(isSet(code, _)).values.toList
    if (isSet(code, reverseFlag))
      actions.reverse
    else
      actions
  }

  def handshake(code: String): Seq[String] =
    Try(handshake(Integer.parseInt(code, 2))).getOrElse(List())

  private def isSet(code: Int, flag: Int) = (code & flag) == flag
}
