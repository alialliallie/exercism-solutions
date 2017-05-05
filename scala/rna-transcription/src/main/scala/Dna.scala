object Dna {
  val rna = Map(
    'G' -> 'C',
    'C' -> 'G',
    'T' -> 'A',
    'A' -> 'U'
  )
  def toRna(sequence: String): Option[String] =
    Some(sequence)
      .filter(_.toSet.diff(rna.keySet).isEmpty)
      .map(s => s.map(rna))
}
