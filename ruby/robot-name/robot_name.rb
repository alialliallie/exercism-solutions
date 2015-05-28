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
    prefix = ('A'..'Z').to_a.sample(2).join
    designation = format('%03d', rand(999))
    @name = "#{prefix}#{designation}"
  end
end
