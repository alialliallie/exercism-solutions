class Cipher
  attr_accessor :key

  def initialize(key = nil)
    @key = key || random_key
    fail ArgumentError if @key.match(/[^a-z]/)
    fail ArgumentError if @key.empty?
  end

  def encode(text)
    text.chars.zip(@key.chars.cycle)
      .map(&method(:substitute))
      .map(&:chr).join
  end

  def decode(text)
    text.chars.zip(@key.chars.cycle)
      .each_with_object(true)
      .map(&method(:substitute))
      .map(&:chr).join
  end

  private

  def substitute((c, k), decode = false)
    shift = alpha(k)
    shift = -shift if decode
    'a'.ord + ((alpha(c) + shift) % 26)
  end

  def random_key(size = 10)
    (1..size).map { rand(97..122).chr }.join
  end

  def alpha(c)
    c.ord - 'a'.ord
  end
end
