class Triangle
  def initialize(rows)
    @rows = rows
  end

  def rows
    (0..(@rows - 1)).map { |r| a_row(r) }
  end

  private

  def a_row(n)
    (0..n).map { |k| binomial(n, k) }
  end

  def binomial(n, k)
    return 1 if n - k <= 0
    return 1 if k <= 0
    factorial(n) / (factorial(k) * factorial(n - k))
  end

  def factorial(n)
    (1..n).reduce(:*)
  end
end
