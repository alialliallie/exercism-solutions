class Anagram(val word: String) {
  val normalizedWord = normalize(word)

  def matches(others: Seq[String]): Seq[String] =
    others.filter(isAnagram(_))

  private def isAnagram(other: String): Boolean =
    !other.equalsIgnoreCase(word) && normalizedWord == normalize(other)

  private def normalize(word: String) =
    word.toLowerCase.sorted
}
