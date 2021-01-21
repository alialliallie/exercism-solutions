fun Int.luhnDouble(): Int {
  val double = this * 2
  return if (double > 9)
    double - 9
  else
    double
}
object Luhn {
  fun isValid(candidate: String): Boolean {
    if (candidate.trim().length < 2)
      return false
    if (candidate.matches(Regex(".*[^0-9 ].*")))
      return false

    val digits = candidate.filter(Char::isDigit).reversed().mapIndexed {i, c ->
      if (i % 2 == 1)
        Character.getNumericValue(c).luhnDouble()
      else
        Character.getNumericValue(c)
    }
    val checksum = digits.sum()
    return checksum % 10 == 0
  }
}
