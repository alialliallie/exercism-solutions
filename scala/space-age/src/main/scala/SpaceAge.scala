import scala.math.pow

case class SpaceAge(val seconds: Long) {

  implicit class RoundedDouble(n: Double) {
    def rounded(scale: Int): Double = {
      val s = pow(10, scale)
      (n * s).round / s.toDouble
    }
  }

  val EARTH_PERIOD = 31557600L

  lazy val onMercury = earthRelative(0.2408467)
  lazy val onVenus   = earthRelative(0.61519726)
  lazy val onEarth   = earthRelative(1.0)
  lazy val onMars    = earthRelative(1.8808158)
  lazy val onJupiter = earthRelative(11.862615)
  lazy val onSaturn  = earthRelative(29.447498)
  lazy val onUranus  = earthRelative(84.016846)
  lazy val onNeptune = earthRelative(164.79132)

  private def earthRelative(ratio: Double): Double =
    (seconds / (EARTH_PERIOD * ratio)).rounded(2)
}
