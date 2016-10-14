module RailFenceCipher
  VERSION = 1

  module_function

  def encode(raw, rails)
    hash_by_post(raw, oscillation(rails).cycle)
      .values
      .flatten
      .join
  end

  def decode(cypher, rails)
    # Take the set of fence posts that would have been used for the encoding
    # and sort them to determine which letter came from which post, then pair
    # them with the cyphertext
    posts = oscillation_seq(rails, cypher.length)
    posted_chars = hash_by_post(cypher, posts.dup.sort)

    # with original oscillation, pluck next letter off each rail
    posts
      .each_with_object([]) { |rail, raw| raw << posted_chars[rail].shift }
      .join
  end

  # Create a sequence that runs from 0 up to max then down to 1.
  # The end on 1 allows the sequence to be cycled.
  # Example:
  #   oscillation(4) returns [0, 1, 2, 3, 2, 1]
  def oscillation(max)
    limit = max - 1
    up = (0..limit).to_a
    down = (1..limit - 1).to_a.reverse if max > 2
    up + (down || [])
  end

  # Create a finite sequence of oscillation repeats
  def oscillation_seq(max, length)
    oscillation(max).cycle.take(length)
  end

  # Given a string and a matching sequence of posts, return a hash of rails
  # to array of characters on the rail
  def hash_by_post(string, posts)
    string
      .chars
      .zip(posts)
      .each_with_object(Hash.new { [] }) { |(c, rail), h| h[rail] += [c] }
  end
end
