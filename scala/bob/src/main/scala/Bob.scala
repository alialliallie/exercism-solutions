class Bob {
  def hey(remark: String) = {
    if (isShouting(remark))
      "Whoa, chill out!"
    else if (isQuestion(remark))
      "Sure."
    else if (isSilence(remark))
      "Fine. Be that way!"
    else
      "Whatever."
  }

  val letters = ".*[A-Z].*".r

  def isShouting(remark: String): Boolean = {
    val upcased = remark.toUpperCase
    upcased match {
      case letters() => remark == upcased
      case _         => false
    }
  }
  def isQuestion(remark: String) = remark.endsWith("?")
  def isSilence(remark: String)  = remark.trim.isEmpty
}
