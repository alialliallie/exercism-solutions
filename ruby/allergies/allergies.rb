class Allergies
  attr_accessor :allergies

  def initialize(allergies)
    @allergies = allergies
  end

  def allergic_to?(thing)
    @allergies & ALLERGIES[thing] == ALLERGIES[thing]
  end

  def list
    ALLERGIES.each_with_object([]) do |(name, _), l|
      l << name if allergic_to?(name)
    end
  end

  ALLERGIES = {
    'eggs'         => 1,
    'peanuts'      => 2,
    'shellfish'    => 4,
    'strawberries' => 8,
    'tomatoes'     => 16,
    'chocolate'    => 32,
    'pollen'       => 64,
    'cats'         => 128
  }
end
