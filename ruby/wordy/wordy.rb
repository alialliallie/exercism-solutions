class WordProblem
  attr_accessor :input
  def initialize(text)
    @input = text
  end

  def answer
    tokens = tokenize(input)
    fail ArgumentError unless tokens.any? { |t| OPS.key? t }
    evaluate(parse(tokens))
  end

  private

  Oper = Struct.new(:operator, :precedence) do
    # Always assume left associative given the tested operations
    def takes_precedence?(other)
      return false unless other
      precedence <= other.precedence
    end

    def to_s
      "#{operator}"
    end
  end

  OPS = {
    'plus' => Oper.new(:+, 0),
    'minus' => Oper.new(:-, 0),
    'multiplied' => Oper.new(:*, 0),
    'divided' => Oper.new(:/, 0)
  }
  # We're going to do a shunting parser here

  # Simple tokenizer, numbers or operwords
  def tokenize(text)
    text.gsub('?', '')
      .split(' ')
      .keep_if { |t| OPS.key?(t) || t.match(/\A-?\d+\Z/) }
  end

  # Parse into a postfix notation because easier
  def parse(tokens)
    result = []
    opers = []
    tokens.each do |token|
      if token.match(/\A-?\d+\Z/)
        result.push token.to_i
      else
        oper = OPS[token]
        result.push(opers.pop) if oper.takes_precedence?(opers.last)
        opers.push(oper)
      end
    end
    result + opers.reverse
  end

  def evaluate(operations)
    operations.each_with_object([]) do |op, stack|
      if op.respond_to? :operator
        stack.push(stack.pop(2).reduce(op.operator))
      else
        stack.push op
      end
    end.pop
  end
end
