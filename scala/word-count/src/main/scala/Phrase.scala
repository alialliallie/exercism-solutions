class Phrase(val phrase: String) {
  def wordCount: Map[String, Int] =
    phrase
      .split("[^\\w']")
      .filterNot(_.isEmpty)
      .map(_.toLowerCase)
      .foldLeft(Map[String, Int]())((a, e) => a.updated(e, a.getOrElse(e, 0) + 1))
}
