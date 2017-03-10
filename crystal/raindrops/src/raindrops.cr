module Raindrops
  DROPS = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  def self.drops(count)
    drops = DROPS.map {|n, str| str if count % n == 0}.compact
    drops.empty? ? count.to_s : drops.join
  end
end
