module PigLatin
  def self.translate(text)
    text.split(' ').map { |word| translate_word(word) }.join(' ')
  end

  private

  VOWELS = %w(a e i o u)
  CONSONANT_SPECIALS = [
    /\A[^aeiou]*qu/
  ]

  VOWEL_SPECIALS = [
    /\Ay[^aeiou]/,
    /\Ax[^aeiou]/
  ]

  def self.translate_word(word)
    first, rest = explode(word)
    "#{rest}#{first}ay"
  end

  def self.explode(word)
    special_case = CONSONANT_SPECIALS.find { |r| r.match(word) }
    vowel_case = VOWEL_SPECIALS.find { |r| r.match(word) }
    if special_case
      first = word.match(special_case)
    elsif vowel_case
      first = ''
    else
      first = word.chars.take_while { |t| !VOWELS.include?(t) }.join
    end
    [first, word.gsub(/\A#{first}/, '')]
  end
end
