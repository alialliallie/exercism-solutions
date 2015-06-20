
class Scrabble
  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @word = (word || '').gsub(/[^A-z]/, '').downcase
  end

  def score
    @word.chars.reduce(0) do |score, c|
      score + Scrabble.points[c]
    end
  end

  def self.points
    return @points if @points
    @points = {}
    %w(a e i o u l n r s t).each { |c| @points[c] = 1 }
    %w(d g).each { |c| @points[c] = 2 }
    %w(b c m p).each { |c| @points[c] = 3 }
    %w(f h v w y).each { |c| @points[c] = 4 }
    %w(k).each { |c| @points[c] = 5 }
    %w(j x).each { |c| @points[c] = 8 }
    %w(q z).each { |c| @points[c] = 10 }
    @points
  end
end
