class Robot
  attr_reader :name

  def initialize
    @name = rename
  end

  def reset
    begin
      new_name = rename 
    end while new_name == name
    @name = new_name
  end

  private

  LETTERS = ('A'..'Z').to_a
  def rename
    designation = format('%03d', rand(999))
    "#{prefix}#{designation}"
  end

  def prefix
    [LETTERS.sample, LETTERS.sample].join
  end
end
