package strand

import (
	"strings"
)

var conversions = map[rune]rune{
	'C': 'G',
	'G': 'C',
	'A': 'U',
	'T': 'A',
}

func convert(nucleotide rune) rune {
	value, present := conversions[nucleotide]
	if present {
		return value
	}

	panic("invalid nucleotide")
}

func ToRna(strand string) string {
	return strings.Map(convert, strand)
}
