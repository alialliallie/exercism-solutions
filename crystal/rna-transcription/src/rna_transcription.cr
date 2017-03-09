module RnaComplement
  def self.of_dna(strand)
    strand.tr("CGTA", "GCAU")
  end
end
