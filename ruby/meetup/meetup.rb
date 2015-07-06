class Meetup
  WEEKDAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, occurance)
    case occurance
    when :teenth
      teenth(weekday)
    when :first
      nth(weekday, 1)
    when :second
      nth(weekday, 2)
    when :third
      nth(weekday, 3)
    when :fourth
      nth(weekday, 4)
    when :last
      last(weekday)
    end
  end

  private

  def teenth(weekday)
    date = Date.new(@year, @month, 13)
    while date.day < 20
      return date if WEEKDAYS[date.wday] == weekday
      date += 1
    end
    date
  end

  def nth(weekday, n)
    count = 1
    date = Date.new(@year, @month, 1)
    while date.day < 31
      if WEEKDAYS[date.wday] == weekday
        return date if count == n
        count += 1
      end
      date += 1
    end
    date
  end

  def last(weekday)
    date = Date.new(@year, @month, 1)
    last_day = date
    while date.month == @month
      last_day = date if WEEKDAYS[date.wday] == weekday
      date += 1
    end
    last_day
  end
end
