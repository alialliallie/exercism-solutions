class Bst
  attr_reader :data, :left, :right
  def initialize(data)
    @data = data
  end

  def insert(n)
    if n <= data
      left.insert(n) if left
      @left ||= Bst.new(n)
    else
      right.insert(n) if right
      @right ||= Bst.new(n)
    end
  end

  def each
    return enum_for(:each) unless block_given?

    left.each { |n| yield n } if left
    yield data
    right.each { |n| yield n } if right
  end
end
