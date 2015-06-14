class SpaceAge
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

  attr_accessor :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL.keys.each do |orbit|
    define_method("on_#{orbit}") do
      age_on(orbit)
    end
  end

  private

  def age_on(planet)
    seconds.to_f / ORBITAL[planet]
  end
end
