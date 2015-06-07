class Array
  def keep
    kept = []
    self.each do |e|
      kept << e if yield e
    end
    kept
  end

  def discard
    kept = []
    self.each do |e|
      kept << e unless yield e
    end
    kept
  end
end
