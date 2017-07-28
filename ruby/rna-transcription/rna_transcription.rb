class Complement
  DNA_TO_RNA = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }

  def self.of_dna(sequence)
    return '' unless valid?(sequence)
    sequence.chars.map {|nucleotide| DNA_TO_RNA[nucleotide]}.join('')
  end

  private
  def self.valid?(sequence)
    sequence.chars.all? { |c| DNA_TO_RNA.keys.include? c }
  end
end

module BookKeeping
  VERSION = 4
end
