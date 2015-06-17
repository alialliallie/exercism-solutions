package gigasecond

import "time"
import "math"

const TestVersion = 2

var Birthday = time.Date(1980, 4, 3, 21, 30, 0, 0, time.UTC)

var gigasecond = time.Duration(math.Pow(10, 9)) * time.Second

func AddGigasecond(time time.Time) time.Time {
	return time.Add(gigasecond)
}
