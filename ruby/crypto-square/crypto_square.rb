class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @normalized ||= @text.downcase.gsub(/[\W_]/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil.to_i
  end

  def plaintext_segments
    length = normalize_plaintext.length
    0.step(by: size, to: length - 1).map do |start|
      normalize_plaintext[start, size]
    end
  end

  def ciphertext
    by_column.flatten.join
  end

  def normalize_ciphertext
    by_column.map(&:join).join(' ')
  end

  private

  def by_column
    charsets = plaintext_segments.map(&:chars)
    charsets[0].zip(*charsets[1..-1])
  end
end
