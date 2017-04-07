class Phrase(val phrase: String) {
  def wordCount: Map[String, Int] =
    phrase
      .split("[^\\w']")
      .filterNot(_.isEmpty)
      .map(_.toLowerCase)
      .groupBy(w => w)
      .mapValues(_.size)
}
