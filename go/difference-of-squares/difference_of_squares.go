package diffsquares

func SquareOfSums(n int) int {
	sum := (n * (n + 1)) / 2
	return sum * sum
}

func SumOfSquares(n int) (acc int) {
	for i := 1; i <= n; i++ {
		acc += i * i
	}
    return
}

func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
