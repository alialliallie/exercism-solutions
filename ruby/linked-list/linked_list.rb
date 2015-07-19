class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(data)
    if head.nil?
      @head = @tail = Element.new(data)
    else
      d = Element.new(data, nil, tail)
      @tail.next = d
      @tail = d
    end
  end

  def unshift(data)
    if head.nil?
      @head = @tail = Element.new(data)
    else
      d = Element.new(data, head, nil)
      @head.prev = d
      @head = d
    end
  end

  def pop
    old_tail = tail
    @tail = tail.prev
    tail.next = nil if tail
    old_tail.data
  end

  def shift
    old_head = head
    @head = head.next
    head.prev = nil if head
    old_head.data
  end

  Element = Struct.new(:data, :next, :prev)

  private

  attr_accessor :head, :tail
end
