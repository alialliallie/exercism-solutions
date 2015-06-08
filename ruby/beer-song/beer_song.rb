class BeerSong

  def sing
    verses(99, 0)
  end

  def verses(first, last)
    first.downto(last).map { |i| verse(i) }.join("\n") + "\n"
  end

  def verse(num)
    v = case num
        when 1
          singular_verse
        when 0
          final_verse
        else
          [first_stanza(num), second_stanza(num)]
        end
    v.join("\n") + "\n"
  end

  private 

  def first_stanza(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer."
  end

  def second_stanza(num)
    object = (num - 1) == 1 ? "bottle" : "bottles"
    "Take one down and pass it around, #{num-1} #{object} of beer on the wall."
  end

  def singular_verse
    [ "1 bottle of beer on the wall, 1 bottle of beer.",
      "Take it down and pass it around, no more bottles of beer on the wall." ]
  end

  def final_verse
    [ "No more bottles of beer on the wall, no more bottles of beer.",
      "Go to the store and buy some more, 99 bottles of beer on the wall." ]
  end
end
