module ETL
  def self.transform(value)
    pairs = value.flat_map do |score, letters|
      pairs_of(score, letters)
    end
    Hash[*pairs.flatten]
  end

  private

  def self.pairs_of(score, letters)
    letters.map { |l| [l.downcase, score] }
  end
end
