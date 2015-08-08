class Proverb
  attr_accessor :parts

  def initialize(*parts, **options)
    @qualifier = options.fetch(:qualifier, nil)
    @parts = parts
  end

  def to_s
    parts.each_with_index
      .map { |p, i| line(p, i) }
      .compact
      .concat([the_end])
      .join("\n")
  end

  private

  def line(part, index)
    thing = parts[index + 1]
    "For want of a #{part} the #{thing} was lost." if thing
  end

  def the_end
    "And all for the want of a #{qualifier}#{parts[0]}."
  end

  def qualifier
    @qualifier ? @qualifier + ' ' : ''
  end
end
