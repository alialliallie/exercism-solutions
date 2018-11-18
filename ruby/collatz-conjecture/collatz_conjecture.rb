module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n.positive?
    return 0 if n == 1

    collatz_enumerator(n)
      .take_while { |n| n > 1}
      .count + 1
  end

  def self.collatz_enumerator(start)
    Enumerator.new do |y|
      n = start
      loop do
        n = CollatzConjecture.next(n) 
        y << n
      end
    end
  end

  def self.next(n)
    if n.even?
      n / 2
    else
      3 * n + 1
    end
  end
end