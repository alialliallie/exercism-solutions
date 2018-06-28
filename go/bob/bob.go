// Package bob acts like a teenager
package bob

import (
	"regexp"
	"strings"
)

// Hey responds as a teenager to various remarks.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)

	if shouting(remark) && question(remark) {
		return "Calm down, I know what I'm doing!"
	}

	if shouting(remark) {
		return "Whoa, chill out!"
	}

	if question(remark) {
		return "Sure."
	}

	if silence(remark) {
		return "Fine. Be that way!"
	}

	return "Whatever."
}

func shouting(remark string) bool {
	upper := strings.ToUpper(remark)
	match, err := regexp.MatchString("[A-Z]", upper)
	return upper == remark && (match || err != nil)
}

func question(remark string) bool {
	return strings.HasSuffix(remark, "?")
}

func silence(remark string) bool {
	return len(remark) == 0
}
