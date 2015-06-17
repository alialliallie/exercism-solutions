package raindrops

import "fmt"
import "strings"

func Convert(n int) string {
	out := make([]string, 0)
	if n%3 == 0 {
		out = append(out, "Pling")
	}
	if n%5 == 0 {
		out = append(out, "Plang")
	}
	if n%7 == 0 {
		out = append(out, "Plong")
	}
	if len(out) == 0 {
		return fmt.Sprintf("%d", n)
	}
	return strings.Join(out, "")
}
