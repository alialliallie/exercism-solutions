gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'bracket_push'

class BracketPushTest < Minitest::Test
  def test_empty_string
    assert Brackets.paired?('')
  end

  def test_pair_brackets
    assert Brackets.paired?('{}')
  end

  def test_unpaired
    refute Brackets.paired?('[[')
  end

  def test_wrong_ordered
    refute Brackets.paired?(')(')
  end

  def test_paired_nested
    assert Brackets.paired?('([{}({}[])])')
  end

  def test_unpaired_nested
    refute Brackets.paired?('([{])')
  end

  def test_wrong_nested
    refute Brackets.paired?('[({]})')
  end

  def test_right_only
    refute Brackets.paired?(']]]')
  end

  def test_with_text
    assert Brackets.paired?('(fn [a b c] {:a :b})')
  end

  def test_with_text
    refute Brackets.paired?('(fn [a b c] (:a :b})')
  end

  # Don't forget to define a constant VERSION inside of Brackets.
  def test_bookkeeping
    assert_equal 1, Brackets::VERSION
  end
end
