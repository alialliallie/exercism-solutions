module Brackets
  VERSION = 1

  BRACKETS = /[()\[\]{}]/
  def self.paired?(brackets)
    brackets
      .scan(BRACKETS)
      .each_with_object([], &method(:check))
      .length == 0
    rescue InvalidNesting
      false
  end

  private

  def self.check(char, stack)
    if left? char
      stack.push kind(char) 
    end

    if right? char
      last = stack.pop 
      fail InvalidNesting if last != kind(char)
    end
  end

  def self.kind(bracket)
    case bracket
    when '(', ')'
      :round
    when '[', ']'
      :square
    when '{', '}'
      :curly
    end
  end

  def self.left?(bracket)
    %w/( [ {/.include? bracket
  end

  def self.right?(bracket)
    %w/) ] }/.include? bracket
  end

  class InvalidNesting < RuntimeError; end
end
