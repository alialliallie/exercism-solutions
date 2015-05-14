class Phrase
  def initialize(string)
    @words = string.split(/[ ,\n]/)
  end

  def word_count
    @words.reduce({}) do |counts, word|
      word = clean(word)
      next counts if word.empty?

      counts[word] ||= 0
      counts[word] = counts[word] + 1
      counts
    end
  end

  private
  def clean(word)
    word.downcase.gsub(/\W+$/,'')
  end
end
