object Pangrams {
  val ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  def isPangram(sentence: String): Boolean =
    sentence
      .filter(_.isLetter)
      .map(_.toLower)
      .distinct
      .sorted
      .equals(ALPHABET)
}
