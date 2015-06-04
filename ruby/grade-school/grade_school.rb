class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    @students[grade] ||= []
    @students[grade] << name
  end

  def grade(g)
    names = @students[g] || []
    names.sort
  end

  def to_hash
    @students.keys.sort.reduce({}) do |h, grade|
      h[grade] = @students[grade].sort
      h
    end
  end
end
