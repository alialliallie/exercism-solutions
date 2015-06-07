class Array
  def keep
    reduce([]) do |a, e|
      a << e if yield e
      a
    end
  end

  def discard
    keep {|e| !yield e}
  end
end
