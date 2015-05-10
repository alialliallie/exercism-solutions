class Gigasecond
  GIGASEC = 10**9
  def self.from(date)
    date.to_time + GIGASEC
  end
end
