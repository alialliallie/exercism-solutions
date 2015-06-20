class Bst
  attr_reader :data, :left, :right
  def initialize(data = nil)
    @data = data
  end

  def insert(n)
    # Allow leaf nodes to be assigned a value later
    # so that inserts can chain through each parent
    if @data.nil?
      @data = n
    else
      insert_child(n)
    end
  end

  def each
    return enum_for(:each) unless block_given?

    left.each { |n| yield n } if left
    yield data
    right.each { |n| yield n } if right
  end

  private

  def insert_child(n)
    if n <= data
      @left ||= Bst.new
      @left.insert(n)
    else
      @right ||= Bst.new
      @right.insert(n)
    end
  end
end
