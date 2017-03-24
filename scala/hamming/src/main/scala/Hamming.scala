object Hamming {
  def compute(base: String, compare: String): Option[Int] = {
    if (base.length != compare.length) return None

    val distance = base.zip(compare).count(pair => pair._1 != pair._2)
    Some(distance)
  }
}
