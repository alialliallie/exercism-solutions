import scala.annotation.tailrec

object Strain {
  def keep[A](xs: Seq[A], f: A => Boolean): Seq[A] = {
    @tailrec
    def doKeep(xs: Seq[A], f: A => Boolean, acc: Seq[A]): Seq[A] = {
      xs match {
        case Seq() => acc
        case _ => {
          if (f(xs.head))
            doKeep(xs.tail, f, acc :+ xs.head)
          else
            doKeep(xs.tail, f, acc)
        }
      }

    }

    doKeep(xs, f, Seq[A]())
  }

  def discard[A](xs: Seq[A], f: A => Boolean): Seq[A] =
    keep(xs, (x: A) => !f(x))
}