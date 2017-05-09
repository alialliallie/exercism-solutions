import scala.util.Try

object Dna {
  val rna = Map(
    'G' -> 'C',
    'C' -> 'G',
    'T' -> 'A',
    'A' -> 'U'
  )

  def toRna(sequence: String): Option[String] = Try(sequence.map(rna)).toOption
}
