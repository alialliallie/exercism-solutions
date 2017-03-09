module Bob
  def self.hey(remark)
    if shouting? remark
      "Whoa, chill out!"
    elsif asking? remark
      "Sure."
    elsif silent? remark
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  private def self.shouting?(remark)
    remark.upcase == remark && remark.match(/[A-Z]/)
  end

  private def self.asking?(remark)
    remark.ends_with?("?")
  end

  private def self.silent?(remark)
    remark.strip.empty?
  end
end
