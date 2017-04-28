object Squares {
  def sumOfSquares(n: Int): Int =
    (1 to n).map(n => n * n).reduce(_ + _)

  def squareOfSums(n: Int): Long = {
    val x = (1 to n).reduce(_ + _)
    x * x
  }

  def difference(n: Int): Long =
    squareOfSums(n) - sumOfSquares(n)
}
