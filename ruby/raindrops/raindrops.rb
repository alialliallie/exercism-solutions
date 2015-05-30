class Raindrops
  FACTORS = { 3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(num)
    out = ""

    FACTORS.each { |f, s| out << s if num % f == 0 }

    out.empty? ? num.to_s : out
  end
end
