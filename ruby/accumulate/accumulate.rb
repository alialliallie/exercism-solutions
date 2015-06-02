class Array
  def accumulate
    accumulation = []
    self.each do |entry|
      accumulation << yield(entry)
    end
    accumulation
  end
end
