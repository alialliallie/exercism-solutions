import java.lang.NumberFormatException

import scala.util.matching.Regex

object RunLengthEncoding {

  def encode(str: String): String = {

    @scala.annotation.tailrec
    def doEncode(str: String, out: String): String =
      str.span(_ == str.head) match {
        case ("", "") => out
        case (prefix, suffix) => doEncode(suffix, append(out, prefix))
      }

    def append(out: String, prefix: String): String =
      prefix.length match {
        case 1 => out + prefix.head
        case _ => out + prefix.length + prefix.head
      }

    doEncode(str, "")
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
