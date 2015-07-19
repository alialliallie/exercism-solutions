class Series
  def initialize(seq)
    @seq = seq.chars.map(&:to_i)
  end

  def largest_product(size)
    return 1 unless @seq.length > 0
    slices(size).map { |a| a.reduce(:*) }.max
  end

  private

  def slices(size)
    fail ArgumentError if size > @seq.length
    max_start = @seq.length - size
    (0..max_start).each_with_object([]) do |start, set|
      set << @seq.slice(start, size)
    end
  end
end
