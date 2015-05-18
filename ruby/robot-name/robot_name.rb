class Robot
  attr_reader :name

  def initialize
    @name = rename
  end

  def reset
    @name = rename
  end

  private
  def rename
    prefix = ("A".."Z").to_a.shuffle[0,2].join
    designation = "%03d" % rand(999) 
    @name = "#{prefix}#{designation}"
  end
end
