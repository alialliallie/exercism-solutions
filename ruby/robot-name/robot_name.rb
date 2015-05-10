class Robot
  def name
    @name ||= "#{prefix}#{designation}"
  end

  def reset
    @name = nil
  end

  private
  def prefix
    ("A".."Z").to_a.shuffle[0,2].join
  end

  def designation
    "%03d" % rand(999) 
  end
end
