class FoodChainSong
  attr_accessor :verses

  ORDER = [nil] + %w(fly spider bird cat dog goat cow horse)

  VERSE = {
    "horse" => "She's dead, of course!",
    "cow" => "I don't know how she swallowed a cow!",
    "goat" => "Just opened her throat and swallowed a goat!",
    "dog" => "What a hog, to swallow a dog!",
    "cat" => "Imagine that, to swallow a cat!",
    "bird" => "How absurd to swallow a bird!",
    "spider" => "It wriggled and jiggled and tickled inside her.",
    "fly" => "I don't know why she swallowed the fly. Perhaps she'll die."
  }

  WHATEVER = {
    "bird" => "How absurd to swallow a bird!",
    "spider" => "that wriggled and jiggled and tickled inside her",
    "fly" => "I don't know why she swallowed the fly. Perhaps she'll die."
  }

  def initialize
  end

  def sing
    verses(1,8)
  end

  def verses(first, last)
    verses = first.upto(last).map {|v| verse(v) }
    verses.join("\n") + "\n"
  end

  def verse(n)
    thing = ORDER[n]
    lines = stanza(n)
    unless thing == "horse" 
      n.downto(2).each do |i|
        lines << swallowed_why(i, i-1, n)
      end
      lines << VERSE["fly"] unless n == 1
    end
    lines.join("\n") + "\n"
  end

  private
  def stanza(n)
    what = ORDER[n]
    [ "I know an old lady who swallowed a #{what}.",
      VERSE[what] ]
  end

  def swallowed_why(swallowed, target, n)
    x = ORDER[swallowed]
    y = ORDER[target]
    appendix = " " + WHATEVER[y] if target == 2
    "She swallowed the #{x} to catch the #{y}#{appendix||""}."
  end
end
