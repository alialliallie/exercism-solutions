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
    word != @word && word.chars.sort == @word.chars.sort
  end
end
