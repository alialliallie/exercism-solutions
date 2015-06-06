class Series
  def initialize(seq)
    @seq = seq.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > @seq.length
    max_start = @seq.length - size
    (0..max_start).each_with_object([]) do |start, set|
      set << @seq.slice(start, size)
    end
  end
end
