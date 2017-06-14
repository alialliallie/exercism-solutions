import scala.annotation.tailrec

object Series {
  type IntSeries = Seq[Seq[Int]]

  /**
    * Using `digits.sliding` is succinct but feels like cheating.
    */
  def slices(size: Int, digits: String): IntSeries = {
    @tailrec
    def doSlice(size: Int, digits: String, acc: IntSeries): IntSeries = {
      digits match {
        case d if digits.length >= size =>
          doSlice(size, d.tail, acc :+ d.take(size).map(_.toString.toInt))
        case _ =>
          acc
      }
    }

    doSlice(size, digits, Seq[Seq[Int]]())
  }
}
