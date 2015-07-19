#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'twelve_days'

class TwelveDaysTest < Minitest::Test
  # This test is an acceptance test.
  #
  # If you find it difficult to work the problem with so much
  # output, go ahead and add a `skip`, and write whatever
  # unit tests will help you. Then unskip it again
  # to make sure you got it right.
  # There's no need to submit the tests you write, unless you
  # specifically want feedback on them.
  def test_the_whole_song
    expected = @song
    assert_equal expected, TwelveDays.song
  end

  def setup
    song_file = File.expand_path('../song.txt', __FILE__)
    @song = IO.read(song_file)
    @verses = [nil] + @song.split("\n\n")
  end

  def test_individual_verses
    1.upto(12) do |v|
      expected = @verses[v].strip
      assert_equal expected, TwelveDays.verse(v)
    end
  end

  # This is some simple book-keeping to let people who are
  # giving feedback know which version of the exercise you solved.
  def test_version
    assert_equal 1, TwelveDays::VERSION
  end
end
