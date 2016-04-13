module Pangram
  VERSION = 1
  ALPHA = ('a'..'z').to_a.join
  def self.is_pangram?(sentence)
    sentence.downcase.gsub(/[^a-z]/, '').chars.uniq.sort.join == ALPHA
  end
end
