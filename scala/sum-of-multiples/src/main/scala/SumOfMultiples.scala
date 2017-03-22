object SumOfMultiples {
  def sumOfMultiples(factors: Set[Int], limit: Int): Int =
    List.range(1, limit).filter(hasFactors(factors)).sum

  private def hasFactors(factors: Set[Int])(n: Int): Boolean =
    factors.exists(f => n % f == 0)
}

