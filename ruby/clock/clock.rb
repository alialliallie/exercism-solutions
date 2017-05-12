class Clock
  ONE_DAY = 24 * 60

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def initialize(hour, minutes)
    @minutes = (hour * 60) + minutes
  end

  def to_s
    h = (minutes / 60)
    m = (minutes % 60)
    sprintf("%02d:%02d", h, m)
  end

  def +(m)
    Clock.at(0, minutes + m)
  end

  def -(m)
    Clock.at(0, minutes - m)
  end

  def ==(other)
    minutes == other.minutes
  end

  protected

  def minutes
    @minutes % ONE_DAY
  end
end

module BookKeeping
  VERSION = 2
end
