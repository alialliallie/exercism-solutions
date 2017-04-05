import java.lang.NumberFormatException

import scala.util.matching.Regex

object RunLengthEncoding {

  def encode(str: String): String = {

    def doEncode(str: List[Char], out: String, last: Option[Char], n: Int): String =
      str match {
        case Seq() =>
          append(out, last, n)
        case (c: Char) :: (rest: List[Char]) if n == 0 =>
          doEncode(rest, out, Some(c), 1)
        case (c: Char) :: (rest: List[Char]) if last.contains(c) =>
          doEncode(rest, out, Some(c), n + 1)
        case str =>
          doEncode(str, append(out, last, n), last, 0)
      }


    def append(out: String, c: Option[Char], n: Int): String =
      (c, n) match {
        case (Some(c), 1) => out + c
        case (Some(c), _) => out + n + c
        case (None, _) => out
      }

    doEncode(str.toList, "", None, 0)
  }


  val chunk = "(\\d*)(\\D{1})".r

  def toInt(s: String): Option[Int] =
    try {
      Some(s.toInt)
    } catch {
      case _: Exception => None
    }

  def decode(str: String): String =
    str match {
      case "" => ""
      case _ => chunk.findAllMatchIn(str)
        .map(s => { s.group(2) * toInt(s.group(1)).getOrElse(1) })
        .reduce((a, e) => a ++ e)
    }
}
