Palindrome = Struct.new(:value, :factors)

class Palindromes
  def initialize(opts)
    max = opts.fetch(:max_factor)
    min = opts.fetch(:min_factor, 1)
    @range = (min..max)
  end

  def generate
    @palindromes = {}
    @range.each do |i|
      @range.each do |j|
        n = i * j
        next unless n.to_s.chars == n.to_s.chars.reverse
        @palindromes[n] ||= Palindrome.new(n, [])
        @palindromes[n].factors << [i, j].sort
        @palindromes[n].factors.uniq!
      end
    end
  end

  def largest
    @palindromes[@palindromes.keys.max]
  end

  def smallest
    @palindromes[@palindromes.keys.min]
  end
end
