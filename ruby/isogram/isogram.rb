module Isogram
  def self.isogram?(word)
    letters = word.downcase.scan(/\w/)
    letters.uniq.length == letters.length
  end
end