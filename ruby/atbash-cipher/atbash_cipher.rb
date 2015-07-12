module Atbash
  NUMBERS = Hash[*('0'..'9').to_a.zip(('0'..'9').to_a).flatten]
  LETTERS = Hash[*('a'..'z').to_a.zip(('a'..'z').to_a.reverse).flatten]
  KEY = LETTERS.merge(NUMBERS)
  CHUNK_SIZE = 5

  def self.encode(text)
    encoded = text.downcase.chars.map { |c| KEY[c] }.reject { |c| c.nil? }
    out = []
    encoded.each_slice(CHUNK_SIZE) { |s| out << s.join }
    out.join(' ')
  end
end
