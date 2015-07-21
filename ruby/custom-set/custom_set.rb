class CustomSet
  def initialize(data = [])
    @data = data.to_a.flatten.each_with_object({}) { |d, h| h[d] = true }
  end

  def put(d)
    data[d] = true
    self
  end

  def delete(d)
    data.delete(d)
    self
  end

  def difference(set)
    CustomSet.new(data.keys.reject { |k| set.data.key? k })
  end

  def intersection(set)
    CustomSet.new(data.keys.find_all { |k| set.data.key? k })
  end

  def union(set)
    CustomSet.new(to_a + set.to_a)
  end

  def disjoint?(set)
    intersection(set).size == 0
  end

  def subset?(set)
    intersection(set).size == set.size
  end

  def to_a
    data.keys.dup
  end

  def size
    data.length
  end

  def empty
    @data.clear
    self
  end

  def member?(d)
    data.key? d
  end

  def ==(other)
    size == other.size && difference(other).size == 0
  end

  protected

  attr_accessor :data
end
