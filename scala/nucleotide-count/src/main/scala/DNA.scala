import java.util.NoSuchElementException

class DNA(dna: String) {
  val valid = Set('A', 'C', 'G', 'T')
  val baseCounts = Map('A' -> 0, 'T' -> 0, 'C' -> 0, 'G' -> 0)

  def count(nucleotide: Char): Either[String, Int] =
    try {
      nucleotideCounts.right.map(counts => counts(nucleotide))
    } catch {
      case _: NoSuchElementException => Left(invalidMsg(nucleotide))
    }

  def nucleotideCounts: Either[String, Map[Char, Int]] =
    invalid match {
      case None => Right(baseCounts ++ dna.groupBy(c => c).mapValues(_.length))
      case Some(nucleotide) => Left(invalidMsg(nucleotide))
    }

  private def invalid = dna.find(!valid.contains(_))
  private def invalidMsg(nucleotide: Char): String =
   s"invalid nucleotide '$nucleotide'"
}
