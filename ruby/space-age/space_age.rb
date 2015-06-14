class SpaceAge
  attr_accessor :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    age_on(:earth)
  end

  def on_mercury
    age_on(:mercury)
  end

  def on_venus
    age_on(:venus)
  end

  def on_mars
    age_on(:mars)
  end

  def on_jupiter
    age_on(:jupiter)
  end

  def on_saturn
    age_on(:saturn)
  end

  def on_uranus
    age_on(:uranus)
  end

  def on_neptune
    age_on(:neptune)
  end

  private

  EARTH_PERIOD = 31_557_600
  ORBITAL = {
    mercury: EARTH_PERIOD * 0.2408467,
    venus: EARTH_PERIOD * 0.61519726,
    earth: EARTH_PERIOD,
    mars: EARTH_PERIOD * 1.8808158,
    jupiter: EARTH_PERIOD * 11.862615,
    saturn: EARTH_PERIOD * 29.447498,
    uranus: EARTH_PERIOD * 84.016846,
    neptune: EARTH_PERIOD * 164.79132
  }

  def age_on(planet)
    seconds.to_f / ORBITAL[planet]
  end
end
