class Frame < Array
  def <<(pins)
    raise 'Pins must have a value from 0 to 10' if 0 > pins || pins > 10
    super pins
  end

  def open?
    !strike? && !spare?
  end

  def strike?
    length == 1 && score == 10
  end

  def spare?
    length == 2 && score == 10
  end

  def done?
    length == 2 || strike?
  end

  def score
    reduce(0, &:+)
  end

  def over?(pins)
    return false if empty?
    self[0] + pins > 10
  end
end
