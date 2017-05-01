import scala.annotation.tailrec

class Accumulate {
  def accumulate[A, B](f: A => B, xs: Seq[A]): Seq[B] = {

    @tailrec
    def doAccumulate[A, B](f: A => B, xs: Seq[A], acc: Seq[B]): Seq[B] = {
      xs match {
        case Seq() => acc
        case _ => doAccumulate(f, xs.tail, acc :+ f(xs.head))
      }
    }

    doAccumulate(f, xs, Seq[B]())
  }
}
