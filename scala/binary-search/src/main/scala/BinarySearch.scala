import scala.annotation.tailrec

object BinarySearch {
  def search(items: Array[Int], target: Int): Option[Int] = {

    @tailrec
    def doSearch(items: Array[Int], target: Int, begin: Int, end: Int): Option[Int] = {
      val midPoint: Int = (begin + end) / 2
      val candidate = items(midPoint)

      if (candidate == target)
        Some(midPoint)
      else if (begin == end)
        None
      else if (candidate > target)
        doSearch(items, target, begin, Seq(0, midPoint - 1).max)
      else
        doSearch(items, target, Seq(midPoint + 1, items.length -1).min, end)
    }

    if (items.isEmpty)
      None
    else
      doSearch(items, target, 0, items.length - 1)
  }
}