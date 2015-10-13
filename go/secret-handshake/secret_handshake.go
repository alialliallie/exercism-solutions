package secret

const (
	wink = 1 << iota
	blink
	closed
	jump
	reverse
)

func Handshake(code int) []string {
	a := make([]string, 0)
	if code < 0 {
		return a
	}
	if code&wink == wink {
		a = append(a, "wink")
	}
	if code&blink == blink {
		a = append(a, "double blink")
	}
	if code&closed == closed {
		a = append(a, "close your eyes")
	}
	if code&jump == jump {
		a = append(a, "jump")
	}
	if code&reverse == reverse {
		a = reversed(a)
	}
	return a
}

func reversed(actions []string) []string {
	for i, j := 0, len(actions)-1; i < j; i, j = i+1, j-1 {
		actions[i], actions[j] = actions[j], actions[i]
	}
	return actions
}
