class Nucleotide
  def self.from_dna(strand)
    Nucleotide.new(strand)
  end

  def initialize(strand)
    fail ArgumentError if strand.match(/[^ATCG]/)
    @strand = strand
  end

  def count(nucleotide)
    @strand.chars.count { |c| c == nucleotide }
  end

  def histogram
    %w(A T C G).each_with_object({}) do |c, hist|
      hist[c] = count(c)
    end
  end
end
