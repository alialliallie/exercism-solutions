object Hamming {
  def compute(base: String, compare: String): Int = {
    if (base.length != compare.length) throw new IllegalArgumentException

    base.zip(compare).count(pair => pair._1 != pair._2)
  }
}
