module ListOps
  module_function

  def arrays(xs)
    fold(0, xs) { |acc, _x| acc + 1 }
  end

  # These are somewhat dirty because they're mutating the array.
  # (reverse, concat, map, filter)
  def reverser(xs)
    fold([], xs) { |acc, x| acc.unshift(x) }
  end

  def concatter(xs, ys)
    fold(xs, ys, &:<<)
  end

  def mapper(xs, &f)
    fold([], xs) { |acc, x| acc << f[x] }
  end

  def filterer(xs, &f)
    fold([], xs) { |acc, x| f[x] ? acc << x : acc }
  end

  def sum_reducer(xs)
    fold(0, xs, &:+)
  end

  def factorial_reducer(xs)
    fold(1, xs, &:*)
  end

  def fold(acc, xs, &_f)
    xs.each do |x|
      acc = yield acc, x
    end
    acc
  end
end

module BookKeeping
  VERSION = 2
end
