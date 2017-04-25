class DNA(dna: String) {
  val valid = Set('A', 'T', 'C', 'G')
  val baseCounts = Map('A' -> 0, 'T' -> 0, 'C' -> 0, 'G' -> 0)

  def count(nucleotide: Char): Either[String, Int] =
    for {
      n <- validNucleotide(nucleotide)
      counts <- nucleotideCounts
    } yield counts(n)

  def nucleotideCounts: Either[String, Map[Char, Int]] =
    invalid match {
      case None => Right(baseCounts ++ dna.groupBy(c => c).mapValues(_.length))
      case Some(nucleotide) => Left(invalidMsg(nucleotide))
    }

  private def validNucleotide(nucleotide: Char): Either[String, Char] =
    Either.cond(valid.contains(nucleotide),
      nucleotide,
      invalidMsg(nucleotide))

  private def invalid: Option[Char] = dna.find(!valid.contains(_))
  private def invalidMsg(nucleotide: Char): String =
   s"invalid nucleotide '$nucleotide'"
}
