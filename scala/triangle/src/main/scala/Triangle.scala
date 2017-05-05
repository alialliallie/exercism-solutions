case class Triangle(a: Int, b: Int, c: Int) {
  val sides = Seq(a, b, c).sorted

  lazy val triangleType: TriangleType.Value = {
    if (sides(0) <= 0 || (sides(0) + sides(1) < sides(2))) {
      TriangleType.Illogical
    } else if (sides.distinct.size == 1) {
      TriangleType.Equilateral
    } else if (sides.distinct.size == 2) {
      TriangleType.Isosceles
    } else {
      TriangleType.Scalene
    }
  }
}

object TriangleType extends Enumeration {
  val Equilateral = Value("Equilateral")
  val Isosceles = Value("Iscosceles")
  val Scalene = Value("Scalene")
  val Illogical = Value("Illogical")
}
