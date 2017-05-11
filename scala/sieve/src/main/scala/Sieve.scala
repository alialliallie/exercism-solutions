object Sieve {

  def addMarks(marks: Set[Int], x: Int, max: Int): Set[Int] = {
    marks ++ x.to(max, x)
  }

  def primesUpTo(n: Int): Seq[Int] = {
    if (n == 1) return List()

    var marks = Set[Int]()
    var primes = List[Int]()
    2.to(n).foreach(x => {
      if (!marks.contains(x)) {
        marks = addMarks(marks, x, n)
        primes = primes :+ x
      }
    })
    primes
  }

}
