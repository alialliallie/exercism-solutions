import scala.collection.immutable.TreeMap

class School {
  var students = TreeMap[Int, Seq[String]]()
    .withDefaultValue(Seq())

  def add(name: String, grade: Int): Unit = {
    val currentGrade = students(grade)
    students = students.updated(grade, currentGrade ++ Seq(name))
  }

  def grade(grade: Int): Seq[String] = {
    students(grade)
  }

  def sorted: Map[Int, Seq[String]] = {
    students.mapValues(s => s.sorted)
  }

  def db: Map[Int, Seq[String]]= students
}
