module Brackets
  VERSION = 1

  BRACKETS = /[()\[\]{}]/
  def self.paired?(brackets)
    brackets
      .scan(BRACKETS)
      .each_with_object([], &method(:check))
      .empty?
  rescue InvalidNesting
    false
  end

  def self.check(char, stack)
    stack.push kind(char) if left? char

    if right? char
      last = stack.pop
      raise InvalidNesting if last != kind(char)
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
