import java.time.temporal.ChronoUnit
import java.time.{DayOfWeek, LocalDate, YearMonth}

case class Meetup(month: Int, year: Int) {
  import Meetup._

  val daysInCurrentMonth: Int =
    YearMonth.of(year, month).lengthOfMonth()

  def teenth(day: DayOfWeek): LocalDate = {
    val begin = LocalDate.of(year, month, 13)
    iterateFrom(begin).find(d => d.getDayOfWeek == day).get
  }

  def first(day: DayOfWeek): LocalDate = {
    val begin = LocalDate.of(year, month, 1)
    iterateFrom(begin).find(d => d.getDayOfWeek == day).get
  }

  def second(day: DayOfWeek): LocalDate =
    first(day).plus(7, ChronoUnit.DAYS)

  def third(day: DayOfWeek): LocalDate =
    first(day).plus(14, ChronoUnit.DAYS)

  def fourth(day: DayOfWeek): LocalDate =
    first(day).plus(21, ChronoUnit.DAYS)

  def last(day: DayOfWeek): LocalDate = {
    val begin = LocalDate.of(year, month, daysInCurrentMonth)
    iterateFrom(begin, -1).find(d => d.getDayOfWeek == day).get
  }
}

object Meetup {
  val Mon = DayOfWeek.MONDAY
  val Tue = DayOfWeek.TUESDAY
  val Wed = DayOfWeek.WEDNESDAY
  val Thu = DayOfWeek.THURSDAY
  val Fri = DayOfWeek.FRIDAY
  val Sat = DayOfWeek.SATURDAY
  val Sun = DayOfWeek.SUNDAY

  private def iterateFrom(start: LocalDate, amount: Int = 1): Iterator[LocalDate] = {
    Iterator.iterate(start)(d => d.plus(amount, ChronoUnit.DAYS))
  }
}
