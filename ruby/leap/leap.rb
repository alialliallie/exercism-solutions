class Year
  def self.leap?(year)
    fourth_cent = year % 400 == 0
    century = year % 100 == 0 
    fourth = year % 4 == 0
    fourth_cent || (!century && fourth)
  end
end
