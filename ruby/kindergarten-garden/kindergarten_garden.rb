class Garden
  def initialize(layout, students = nil)
    @garden = parse(layout)
    @students = students || DEFAULT_STUDENTS
    @students.map!(&:downcase).sort!
  end

  def method_missing(method)
    name = method.id2name.downcase
    @garden[@students.find_index(name)].map { |p| PLANTS[p] }
  end

  private

  DEFAULT_STUDENTS = %w(alice bob charlie david eve fred ginny harriet ileana
                        joseph kincaid larry)

  PLANTS = {
    'R' => :radishes,
    'C' => :clover,
    'G' => :grass,
    'V' => :violets
  }

  def parse(layout)
    layout.split("\n")
      .map { |r| r.chars.each_slice(2).to_a }
      .reduce(:zip)
      .map { |r1, r2| r1 + r2 }
  end
end
