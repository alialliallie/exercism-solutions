
class Scrabble
  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @word = word.to_s.gsub(/\W/, '').downcase
  end

  def score
    @word.chars.map(&method(:points)).reduce(0, &:+)
  end

  private

  def points(c)
    POINTS.find { |letters, p| letters.include? c }.last
  end

  POINTS = {
    'aeioulnrst' => 1,
    'dg' => 2,
    'bcmp' => 3,
    'fhvwy' => 4,
    'k' => 5,
    'jx' => 8,
    'qz' => 10
  }
end
