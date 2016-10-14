module RailFenceCipher
  VERSION = 1

  module_function

  def encode(raw, rails)
    raw
      .chars
      .zip(oscillation(rails).cycle)
      .each_with_object(Hash.new { [] }) { |(c, rail), h| h[rail] += [c] }
      .values
      .flatten
      .join
  end

  def decode(cypher, rails)
    # Take the set of fence posts that would have beenused for the encoding
    # and sort them to determine which letter came from which post
    posts = oscillation(rails).cycle.take(cypher.length).sort
    # pair each cypher letter with the originating post
    posted_chars = cypher.chars.zip(posts)
      .each_with_object(Hash.new { [] }) { |(c, rail), h| h[rail] += [c] }
    # with original oscillation, pluck next letter of each rail
    oscillation(rails)
      .cycle
      .take(cypher.length)
      .each_with_object([]) do |rail, raw|
        raw << posted_chars[rail].shift
      end.join
  end

  def oscillation(max)
    limit = max - 1
    up = (0..limit).to_a
    down = (1..limit - 1).to_a.reverse if max > 2
    up + (down || [])
  end
end
