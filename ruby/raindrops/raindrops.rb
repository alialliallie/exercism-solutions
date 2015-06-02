class Raindrops
  FACTORS = { 3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(num)
    result = FACTORS.each_with_object("") do |(f, s), out|
      out << s if num % f == 0 
    end

    result.empty? ? num.to_s : result
  end
end
