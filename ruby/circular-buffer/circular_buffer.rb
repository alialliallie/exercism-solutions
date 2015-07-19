class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    clear(size)
  end

  def read
    fail BufferEmptyException unless buffer[oldest]
    data = buffer[oldest]
    buffer[oldest] = nil
    advance_oldest
    data
  end

  def write(data)
    return unless data
    fail BufferFullException if full?
    advance_newest if buffer[newest]
    buffer[newest] = data
  end

  def write!(data)
    return unless data
    read if full? # toss it
    write(data)
  end

  def clear(size = nil)
    @buffer = [nil] * (size || buffer.length)
    @oldest = 0
    @newest = 0
  end

  private

  def advance_oldest
    self.oldest = (oldest + 1) % buffer.length unless oldest == newest
  end

  def advance_newest
    self.newest = (newest + 1) % buffer.length
  end

  def full?
    return false if buffer.all?(&:nil?)
    (newest + 1) % buffer.length == oldest
  end

  attr_accessor :buffer, :oldest, :newest
end
