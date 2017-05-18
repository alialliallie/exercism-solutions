object ProteinTranslation {
  val proteins = Map(
    "AUG" -> "Methionine",

    "UUU" -> "Phenylalanine",
    "UUC" -> "Phenylalanine",

    "UUA" -> "Leucine",
    "UUG" -> "Leucine",

    "UCU" -> "Serine",
    "UCC" -> "Serine",
    "UCA" -> "Serine",
    "UCG" -> "Serine",

    "UAU" -> "Tyrosine",
    "UAC" -> "Tyrosine",
    "UGU" -> "Cysteine",
    "UGC" -> "Cysteine",

    "UGG" -> "Tryptophan"
  )

  val stop = "UAA"

  def translate(sequence: String): Seq[String] =
    sequence.grouped(3).takeWhile(_ != stop).map(proteins).toSeq
}
