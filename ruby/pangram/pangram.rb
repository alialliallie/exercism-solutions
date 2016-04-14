module Pangram
  VERSION = 1
  ALPHA = ('a'..'z').to_a
  def self.is_pangram?(sentence)
    sentence.downcase.gsub(/[^a-z]/, '').chars.uniq.sort == ALPHA
  end
end
