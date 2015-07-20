class BinarySearch
  def initialize(list)
    fail ArgumentError unless sorted?(list)
    @list = list
  end

  def middle
    list.length / 2
  end

  def search_for(n)
    fail RuntimeError if list.length == 0
    midpoint = list[middle]
    return middle if midpoint == n
    if n < midpoint
      BinarySearch.new(list[0..(middle - 1)]).search_for(n)
    else
      middle + BinarySearch.new(list[(middle + 1)..-1]).search_for(n) + 1
    end
  end

  attr_reader :list

  private

  def sorted?(list)
    list.each_with_index.all? { |e, i| list[i + 1] ? e < list[i + 1] : true }
  end
end
