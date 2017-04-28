import java.time.{LocalDate, LocalDateTime}

object Gigasecond {
  val GIGASECOND = 1000000000

  def addGigaseconds(date: LocalDate): LocalDateTime =
    addGigaseconds(date.atTime(0, 0))

  def addGigaseconds(time: LocalDateTime): LocalDateTime =
    time.plusSeconds(GIGASECOND)

}
