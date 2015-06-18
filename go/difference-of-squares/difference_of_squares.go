package diffsquares

import "math"

func squareInt(n int) int {
	return int(math.Pow(float64(n), 2))
}
func SquareOfSums(n int) int {
	sum := (n * (n + 1)) / 2
	return squareInt(sum)
}

func SumOfSquares(n int) int {
	acc := 0
	for i := 1; i <= n; i++ {
		acc += squareInt(i)
	}
	return acc
}

func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
