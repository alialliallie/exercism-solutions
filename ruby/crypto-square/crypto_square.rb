class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.gsub(/[\W_ ]/,'')
  end

  def size
    root = Math.sqrt(normalize_plaintext.length)
    upper = root.ceil

    return root.to_i if root.to_i == upper
    upper.to_i
  end

  def plaintext_segments
    length = normalize_plaintext.length
    segments = []
    0.step(by: size, to: length - 1) { |start|
      segments << normalize_plaintext[start, size]
    }
    segments
  end

  def ciphertext
    charsets = plaintext_segments.map(&:chars)
    charsets[0].zip(*charsets[1..-1]).flatten.join
  end

  def normalize_ciphertext
    charsets = plaintext_segments.map(&:chars)
    charsets[0].zip(*charsets[1..-1]).map {|set| set.join}.join(' ')
  end
end
