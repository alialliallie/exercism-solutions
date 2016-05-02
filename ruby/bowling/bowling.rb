$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'frame'
require 'score_state'

class Game
  VERSION = 1

  def initialize
    @frames = []
    @current_frame = Frame.new
  end

  def roll(pins)
    ensure_valid pins
    # Do not change state unless valid!
    @current_frame << pins
    push_frame if done_frame?
  end

  def score
    ensure_over
    # By scoring in reverse no lookahead is required, and the scoring state
    # can look back at the last two rolls when encountering a strike or spare
    frames = @frames.reverse
    start = frames.length == 11 ? 1 : 0
    scoring = ScoreState.new(frames)
    frames[start..-1].each_with_object(scoring) do |frame, state|
      state.score(frame)
      state.last_rolls += frame.reverse
    end
    scoring.total
  end

  private

  # Fail if pins rolled is not valid for current game state
  def ensure_valid(pins)
    raise 'Should not be able to roll after game is over.' if over?
    raise 'Pin count exceeds pins on the lane' if over_roll?(pins)
  end

  # Fail if game is not actually over
  # Otherwise, mark game as finished
  def ensure_over
    if @frames.length < 10
      raise 'Score cannot be taken until the end of the game.'
    end
    if @frames[9].strike? && @frames.length != 11
      raise 'Game is not yet over, cannot score!'
    end
  end

  def done_frame?
    if @frames.length == 10
      if @frames.last.strike?
        @current_frame.length == 2
      elsif @frames.last.spare?
        @current_frame.length == 1
      end
    else
      @current_frame.done?
    end
  end

  def push_frame
    @frames << @current_frame unless @current_frame.empty?
    @current_frame = Frame.new
  end

  # Check if the pins rolled would overflow the current frame
  def over_roll?(pins)
    over_frame = @current_frame.over?(pins)
    last_frame = @frames.length == 10
    over_frame && (!last_frame || !@current_frame.strike?)
  end

  def over?
    @frames.length == 10 && @frames.last.open?
  end
end
