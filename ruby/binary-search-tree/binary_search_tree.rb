class Bst
  attr_reader :data, :left, :right
  def initialize(data = nil)
    @data = data
  end

  def insert(n)
    @data = n and return if @data.nil?
    if n <= data
      @left ||= Bst.new
      @left.insert(n)
    else
      @right ||= Bst.new
      @right.insert(n)
    end
  end

  def each
    if left
      left.each { |n| yield n }
    end
    yield data
    if right
      right.each { |n| yield n }
    end
  end
end
