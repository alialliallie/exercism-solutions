case class Year(year: Int) {
  lazy val isLeap = basic && (!century || exceptional)

  private def basic = year % 4 == 0
  private def century = year % 100 == 0
  private def exceptional = year % 400 == 0
}
