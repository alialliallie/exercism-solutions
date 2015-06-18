class Bst
  attr_reader :data, :left, :right
  def initialize(data)
    @data = data
  end

  def insert(n)
    if n <= data
      insert_left(n)
    else
      insert_right(n)
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

  private

  def insert_left(n)
    if @left
      @left.insert(n)
    else
      @left = Bst.new(n)
    end
  end

  def insert_right(n)
    if @right
      @right.insert(n)
    else
      @right = Bst.new(n)
    end
  end
end
