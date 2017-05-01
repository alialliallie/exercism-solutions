object Raindrops {
  val factors = Map(
    3 -> "Pling",
    5 -> "Plang",
    7 -> "Plong"
  )

  def convert(n: Int): String = {
    val pieces = factors.filterKeys(n % _ == 0).values
    if (pieces.isEmpty)
      n.toString
    else
      pieces.mkString("")
  }
}

