class ScoreState
  attr_accessor :total, :last_rolls

  def initialize(frames)
    @total = 0
    @last_rolls = frames.length == 11 ? frames[0] : []
  end

  def score(frame)
    @total += frame.score
    if frame.strike?
      @total += last(2)
    elsif frame.spare?
      @total += last(1)
    end
  end

  def last(n)
    @last_rolls[-n..-1].reduce(0, &:+)
  end
end
