object Isogram {
  def isIsogram(word: String): Boolean = {
    word
      .toLowerCase
      .filter(_.isLetter)
      .groupBy(identity)
      .find{case (_, cs) => cs.length > 1}
      .isEmpty
  }
}