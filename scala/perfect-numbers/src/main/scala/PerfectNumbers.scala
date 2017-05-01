object NumberType extends Enumeration {
  type NumberType = Value
  val Deficient, Perfect, Abundant = Value
}

object PerfectNumbers {
  import NumberType._

  def classify(n: Int): NumberType = {
    val sum = aliquotSum(n)
    if (sum < n)
      NumberType.Deficient
    else if (sum > n)
      NumberType.Abundant
    else // sum == n
      NumberType.Perfect
  }

  private def aliquotSum(n: Int): Int = factors(n).reduce(_ + _)

  private def factors(n: Int): Seq[Int] = 1.until(n).filter(n % _ == 0)
}