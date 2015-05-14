class Bob
  def hey(phrase)
    if silence(phrase)
      'Fine. Be that way!'
    elsif shouting(phrase)
      'Whoa, chill out!'
    elsif asking(phrase)
      'Sure.'
    else
      'Whatever.'
    end
  end

  private
  def shouting(phrase)
    return false unless phrase.match(/[a-zA-Z]/)
    phrase.chars.all? {|c| c.upcase == c}
  end

  def asking(phrase)
    phrase.end_with? '?'
  end

  def silence(phrase)
    phrase.strip.empty?
  end
end
