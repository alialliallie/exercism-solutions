class Raindrops
  def self.convert(num)
    out = ""
    if num % 3 == 0
      out << "Pling"
    end
    if num % 5 == 0
      out << "Plang"
    end
    if num % 7 == 0
      out << "Plong"
    end

    unless out.empty?
      out
    else
      "#{num}"
    end
  end
end
