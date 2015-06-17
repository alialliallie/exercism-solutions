package clock

import "fmt"

const TestVersion = 2
const wholeDay = 24 * 60

type Clock struct {
	hour   int
	minute int
}

func Time(hour, minute int) Clock {
	var midnight = Clock{0, 0}
	var allMinutes = (hour * 60) + minute
	return midnight.Add(allMinutes)
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

func (c Clock) Add(minute int) Clock {
	var minutes = (c.minutes() + minute) % wholeDay
	if minutes < 0 {
		minutes = wholeDay + minutes
	}
	var h, m = divmod(minutes, 60)
	return Clock{h % 24, m}
}

func (c Clock) minutes() int {
	return c.hour*60 + c.minute
}

func divmod(x, y int) (int, int) {
	return x / y, x % y
}
