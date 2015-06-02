class Phrase
  def initialize(string)
    @words = string.split(/[ ,\n]/)
  end

  def word_count
    @words.map {|w| clean(w)}
          .reject(&:empty?)
          .each_with_object(Hash.new(0)) do |word, counts|
            counts[word] += 1
          end
  end

  private
  def clean(word)
    word.downcase.gsub(/\W+$/,'')
  end
end
