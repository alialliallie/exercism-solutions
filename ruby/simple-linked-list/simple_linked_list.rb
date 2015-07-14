class Element
  attr_accessor :datum, :next

  def initialize(datum, nxt)
    @datum = datum
    @next = nxt
  end

  def reverse
    to_a.reduce(nil) { |a, e| Element.new(e, a) }
  end

  def to_a
    Element.to_a(self)
  end

  def nil?
    datum.nil?
  end

  def self.to_a(element)
    return [] unless element
    return [] unless element.datum
    [element.datum].concat(to_a(element.next))
  end

  def self.from_a(arr)
    return Element.new(nil, nil) if arr == []
    # Because ranges
    make_array(arr.to_a)
  end

  def self.make_array(arr)
    return nil if arr.empty?
    Element.new(arr[0], make_array(arr[1..-1]))
  end
end
