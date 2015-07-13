class Proverb
  attr_accessor :parts

  def initialize(*parts)
    @opts = parts.last.is_a?(Hash) ? parts.pop : {}
    @parts = parts
  end

  def to_s
    parts.each_with_index
      .map { |p, i| line(p, i) }
      .concat([the_end])
      .reject(&:nil?)
      .join("\n")
  end

  private

  def line(part, index)
    "For want of a #{part} the #{parts[index + 1]} was lost." if parts[index + 1]
  end

  def the_end
    qualifier = "#{@opts[:qualifier]} " if @opts[:qualifier]
    "And all for the want of a #{qualifier}#{parts[0]}."
  end
end
