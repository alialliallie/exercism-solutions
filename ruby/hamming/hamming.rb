class Hamming
  def self.compute(first_strand, second_strand)
    pairs = first_strand.chars.zip(second_strand.chars)
    pairs.count {|left, right| left != right}
  end
end
