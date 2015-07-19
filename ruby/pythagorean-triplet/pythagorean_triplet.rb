class Triplet
  def self.where(**opts)
    min = opts[:min_factor] || 1
    (min..opts[:max_factor]).to_a.repeated_permutation(3)
      .map(&:sort)
      .uniq
      .map(&Triplet.method(:new))
      .find_all(&:pythagorean?)
      .find_all { |t| opts[:sum] ? t.sum == opts[:sum] : true }
  end

  def initialize(*triplet)
    @triplet = triplet.flatten
  end

  def sum
    triplet.reduce(:+)
  end

  def product
    triplet.reduce(:*)
  end

  def pythagorean?
    triplet[0]**2 + triplet[1]**2 == triplet[2]**2
  end

  attr_accessor :triplet
end
