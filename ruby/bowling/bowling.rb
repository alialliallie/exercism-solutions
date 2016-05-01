class Game
  VERSION = 1

  def initialize
    @frames = []
    @current_frame = []
  end

  def roll(pins)
    ensure_valid pins
    # Do not change state unless valid!
    @current_frame << pins
    push_frame if done_frame?
  end

  def score
    ensure_over
    bonus_rolls = @frames.length == 11
    total = 0
    # No mutation when scoring
    frames = @frames.dup
    until frames.empty?
      frame = frames.shift
      total += if strike? frame
                 10 + next_two_rolls(frames).reduce(&:+)
               elsif spare? frame
                 10 + frames.first[0]
               else
                 frame.reduce(&:+)
               end
      break if bonus_rolls && frames.length == 1
    end
    total
  end

  private

  # Fail if pins rolled is not valid for current game state
  def ensure_valid(pins)
    raise 'Pins must have a value from 0 to 10' if 0 > pins || pins > 10
    raise 'Should not be able to roll after game is over.' if over?
    raise 'Pin count exceeds pins on the lane' if over_roll?(pins)
  end

  # Fail if game is not actually over
  # Otherwise, mark game as finished
  def ensure_over
    if @frames.length < 10
      raise 'Score cannot be taken until the end of the game.'
    end
    if @frames[9] == [10] && @frames.length != 11
      raise 'Game is not yet over, cannot score!'
    end
    @over = true
  end

  def done_frame?
    if @frames.length == 10
      if strike? @frames.last
        @current_frame.length == 2
      elsif spare? @frames.last
        @current_frame.length == 1
      end
    else
      @current_frame.length == 2 || @current_frame[0] == 10
    end
  end

  def push_frame
    @frames << @current_frame unless @current_frame.empty?
    @current_frame = []
  end

  def next_two_rolls(frames)
    frames.take(2).flatten.take(2)
  end

  def strike?(frame)
    frame == [10]
  end

  def spare?(frame)
    frame[0] + frame[1] == 10
  end

  # Check if the pins rolled would overflow the current frame
  def over_roll?(pins)
    return false if @current_frame.empty?

    over_frame = @current_frame[0] + pins > 10
    if @frames.length == 10
      over_frame && @current_frame != [10]
    else
      over_frame
    end
  end

  def over?
    @frames.length == 10 &&
      !strike?(@frames.last) &&
      !spare?(@frames.last)
  end
end
