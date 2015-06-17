package triangle

import "sort"

type Kind int

const (
	NaT Kind = 0
	Equ Kind = 1
	Iso Kind = 2
	Sca Kind = 3
)

func KindFromSides(a, b, c float64) Kind {
	// Normalize
	sides := []float64{a, b, c}
	sort.Float64s(sides)

	for _, s := range sides {
		if s <= 0 || s != s {
			return NaT
		}
	}

	if sides[0]+sides[1] <= sides[2] {
		return NaT
	}

	if sides[0] == sides[1] && sides[1] == sides[2] {
		return Equ
	}

	if sides[0] != sides[1] && sides[0] != sides[2] && sides[1] != sides[2] {
		return Sca
	}

	return Iso
}
