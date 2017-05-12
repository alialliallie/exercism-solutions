class Clock private (totalMinutes: Int) {
  override def toString: String = f"$hour%02d:$minute%02d"

  override def equals(other: scala.Any): Boolean =
    other.isInstanceOf[Clock] &&
      other.asInstanceOf[Clock].minutes == this.minutes

  def hour: Int = minutes / 60
  def minute: Int = minutes % 60

  def minutes: Int = this.totalMinutes % Clock.ONE_DAY

  def +(other: Clock): Clock = Clock(this.minutes + other.minutes)
  def -(other: Clock): Clock = Clock(this.minutes - other.minutes)
}

object Clock {
  val ONE_DAY = 24 * 60

  def apply(minutes: Int): Clock = {
    if (minutes >= 0)
      new Clock(minutes)
    else
      new Clock(ONE_DAY + (minutes % ONE_DAY))
  }

  def apply(hour: Int, minute: Int): Clock = {
    Clock(hour * 60 + minute)
  }
}
