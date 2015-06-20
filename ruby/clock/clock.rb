class Clock
  ONE_DAY = 60 * 24

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def initialize(hour, minutes)
    @minutes = (hour * 60) + minutes
  end

  def to_s
    h = (@minutes / 60).to_s.rjust(2, '0')
    m = (@minutes % 60).to_s.rjust(2, '0')
    "#{h}:#{m}"
  end

  def +(m)
    @minutes += m
    if @minutes > ONE_DAY
      @minutes %= ONE_DAY
    end
    if @minutes < 0
      @minutes = ONE_DAY + @minutes
    end
    self
  end

  def -(m)
    self + -m
  end

  def ==(other)
    minutes == other.minutes
  end

  protected

  attr_reader :minutes
end
