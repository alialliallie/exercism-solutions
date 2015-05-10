class Complement
  DNA_TO_RNA = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }
  RNA_TO_DNA = DNA_TO_RNA.invert

  def self.of_dna(sequence)
    raise ArgumentError if sequence.match(/U/)
    sequence.chars.map {|nucleo| DNA_TO_RNA[nucleo]}.join('')
  end

  def self.of_rna(sequence)
    raise ArgumentError if sequence.match(/T/)
    sequence.chars.map {|nucleo| RNA_TO_DNA[nucleo]}.join('')
  end
end
