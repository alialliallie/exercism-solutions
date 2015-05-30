class Phrase
  def initialize(string)
    @words = string.split(/[ ,\n]/)
  end

  def word_count
    @words.reduce(Hash.new(0)) do |counts, word|
      word = clean(word)
      next counts if word.empty?

      counts[word] = counts[word] + 1
      counts
    end
  end

  private
  def clean(word)
    word.downcase.gsub(/\W+$/,'')
  end
end
