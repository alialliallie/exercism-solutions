class WordProblem
  attr_accessor :input
  def initialize(text)
    @input = text
  end

  def answer
    tokens = tokenize(input)
    fail ArgumentError unless tokens.any? { |t| OPS.value? t }
    evaluate(tokens)
  end

  private

  OPS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied' => :*,
    'divided' => :/
  }

  # Simple tokenizer, numbers or operwords
  def tokenize(text)
    text.delete('?')
      .split(' ')
      .keep_if { |t| OPS.key?(t) || t.match(/\A-?\d+\Z/) }
      .map { |token| token.match(/\A-?\d+\Z/) ? token.to_i : OPS[token] }
  end

  def evaluate(operations)
    operations[1..-1].reduce(operations[0]) do |result, item|
      item.is_a?(Symbol) ? result.method(item) : result.call(item)
    end
  end
end
