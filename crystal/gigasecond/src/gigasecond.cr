module Gigasecond
  GIGA_SECOND = Time::Span.new(0, 0, 1_000_000_000)

  def self.from(time)
    time + GIGA_SECOND
  end
end
