class Translation
  SEQ = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cystine',
    'UGC' => 'Cystine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    SEQ[codon] or fail InvalidCodonError
  end

  def self.of_rna(rna)
    rna.chars.each_slice(3).map do |slice|
      of_codon(slice.join)
    end.take_while { |p| p != 'STOP' }
  end
end

class InvalidCodonError < StandardError
end
