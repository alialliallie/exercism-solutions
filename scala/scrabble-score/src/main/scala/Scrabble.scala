object Scrabble {
  val scores = Map(
    1 -> Seq('A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'),
    2 -> Seq('D', 'G'),
    3 -> Seq('B', 'C', 'M', 'P'),
    4 -> Seq('F', 'H', 'V', 'W', 'Y'),
    5 -> Seq('K'),
    8 -> Seq('J', 'X'),
    10 -> Seq('Q', 'Z')
  ).flatMap { case (s, ls) => ls.map {_ -> s} }

  def scoreLetter(letter: Char): Int = scores(letter.toUpper)

  def scoreWord(word: String): Int = word.map(scoreLetter).sum
}
