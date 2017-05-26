object Dna {
  val rna = Map(
    'G' -> 'C',
    'C' -> 'G',
    'T' -> 'A',
    'A' -> 'U'
  )

  def toRna(sequence: String): Option[String] = {
    val getRna: (Option[String], Char) => Option[String] = {
      case (Some(translated), c) if rna.keySet.contains(c) =>
        Some(translated + rna(c))
      case (_, _) =>
        None
    }
    sequence.foldLeft(Option(""))(getRna)
  }
}
