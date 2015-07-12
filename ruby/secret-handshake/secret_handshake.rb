class SecretHandshake
  attr_accessor :code

  def initialize(code)
    @code = code.to_i
  end

  def commands
    return [] unless valid_code?
    out = []
    out << 'wink' if set?(WINK)
    out << 'double blink' if set?(BLINK)
    out << 'close your eyes' if set?(CLOSE)
    out << 'jump' if set?(JUMP)
    out.reverse! if set?(REVERSE)
    out
  end

  private

  def set?(flag)
    @code & flag > 0
  end

  def valid_code?
    @code >= 0 && code <= 31
  end

  # Flags
  WINK = 1
  BLINK = 2
  CLOSE = 4
  JUMP = 8
  REVERSE = 16
end
