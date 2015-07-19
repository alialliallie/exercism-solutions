module TwelveDays
  VERSION = 1
  def self.song
    1.upto(12).map { |v| verse(v) }.join("\n\n") + "\n"
  end

  def self.verse(num)
    nth = ORDINALS[num]
    gifts = num.downto(1).each_with_index.map do |day|
      if day == 1 && num != 1
        "and #{GIFTS[day]}"
      else
        GIFTS[day]
      end
    end.join(', ')
    "On the #{nth} day of Christmas my true love gave to me, #{gifts}."
  end

  ORDINALS = %w(_ first second third fourth fifth sixth seventh eighth ninth
                tenth eleventh twelfth)
  GIFTS = [
    '',
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ]
end
