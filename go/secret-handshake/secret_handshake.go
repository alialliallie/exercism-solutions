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

	a = addAction(code, wink, "wink", a)
	a = addAction(code, blink, "double blink", a)
	a = addAction(code, closed, "close your eyes", a)
	a = addAction(code, jump, "jump", a)

	if code&reverse == reverse {
		a = reversed(a)
	}
	return a
}

func addAction(code, flag int, action string, list []string) []string {
	if code&flag == flag {
		return append(list, action)
	}
	return list
}

func reversed(actions []string) []string {
	for i, j := 0, len(actions)-1; i < j; i, j = i+1, j-1 {
		actions[i], actions[j] = actions[j], actions[i]
	}
	return actions
}
