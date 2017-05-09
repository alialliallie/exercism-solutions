object Grains {
  def square(n: Int): Option[BigInt] =
    Some(n - 1)
      .filter(_ >= 0)
      .filter(_ <= 63)
      .map(i => BigInt(2).pow(i))

  def total: BigInt = 1.to(64).map(square).flatten.sum
}
