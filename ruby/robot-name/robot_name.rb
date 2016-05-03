require 'set'

class Robot
  attr_reader :name
  @@names = Set.new

  def initialize
    @name = rename
  end

  def reset
    name = rename
    while name_exists? (name)
      name = rename
    end
    @@names.add(name)
    @name = name
  end

  private

  def name_exists?(name)
    @@names.include? name
  end

  LETTERS = ('A'..'Z').to_a
  def rename
    designation = format('%03d', rand(999))
    "#{prefix}#{designation}"
  end

  def prefix
    "#{LETTERS.sample}#{LETTERS.sample}"
  end
end
