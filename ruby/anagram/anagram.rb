class Anagram
  def initialize(word)
    @word = word.downcase
    @letters = @word.chars
  end

  def match(words)
    words.select { |w| acceptable(w.downcase) }
  end

  private

  def acceptable(word)
    return false unless word.length == @word.length
    return false if word == @word

    word.chars.sort == @word.chars.sort
  end
end
