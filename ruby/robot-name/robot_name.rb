require 'set'

class Robot
  LETTERS = ('A'..'Z').to_a

  @@names = Set.new

  def name
    reset if @name.nil?
    @name
  end

  def reset
    @name = unique_name
  end

  private

  def name_exists?(name)
    @@names.include? name
  end

  def unique_name
    name = gen_name
    name = gen_name while name_exists?(name)
    @@names.add(name)
    name
  end

  def gen_name
    "#{prefix}#{designation}"
  end

  def designation
    format('%03d', rand(999))
  end

  def prefix
    "#{LETTERS.sample}#{LETTERS.sample}"
  end
end
