class FoodChainSong
  ORDER = [nil] + %w(fly spider bird cat dog goat cow horse)

  VERSE = {
    'horse' => "She's dead, of course!",
    'cow' => "I don't know how she swallowed a cow!",
    'goat' => 'Just opened her throat and swallowed a goat!',
    'dog' => 'What a hog, to swallow a dog!',
    'cat' => 'Imagine that, to swallow a cat!',
    'bird' => 'How absurd to swallow a bird!',
    'spider' => 'It wriggled and jiggled and tickled inside her.',
    'fly' => "I don't know why she swallowed the fly. Perhaps she'll die."
  }

  def sing
    verses(1, 8)
  end

  def verses(first, last)
    verses = first.upto(last).map { |v| verse(v) }
    trailing_join(verses)
  end

  def verse(n)
    food = ORDER[n]
    lines = stanza(food)
    unless food == 'horse'
      n.downto(2).each do |i|
        lines << swallowed_why(ORDER[i], ORDER[i - 1])
      end
      lines << VERSE['fly'] unless n == 1
    end
    trailing_join(lines)
  end

  private

  def stanza(food)
    ["I know an old lady who swallowed a #{food}.",
     VERSE[food]]
  end

  def swallowed_why(food, target)
    if target == 'spider'
      extra = VERSE[target].gsub(/^It/, 'that')
      "She swallowed the #{food} to catch the #{target} #{extra}"
    else
      "She swallowed the #{food} to catch the #{target}."
    end
  end

  # Join lines with trailing \n per spec
  def trailing_join(lines)
    lines.join("\n") + "\n"
  end
end
