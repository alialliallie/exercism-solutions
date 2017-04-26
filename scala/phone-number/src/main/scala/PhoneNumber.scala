class PhoneNumber(raw: String) {
  val digits = raw.filter(_.isDigit)
  val phoneNumber = validate

  def number: Option[String] = phoneNumber

  lazy val areaCode: Option[String] = phoneNumber.map(_.take(3))
  lazy val localNumber: Option[String] = phoneNumber.map(_.drop(3))
  lazy val prettyPrint: Option[String] =
    for {
      a <- areaCode
      l <- localNumber
      (prefix, suffix) = l.splitAt(3)
    } yield s"(${a}) ${prefix}-${suffix}"

  private def validate: Option[String] =
    Some(digits)
      .filter(d => 10 <= d.length && d.length <= 11)
      .filter(d => !(d.length == 11 && d.head != '1'))
      .map(_.takeRight(10))
}

