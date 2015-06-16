package leap

const TestVersion int = 1

func IsLeapYear(year int) bool {
    var century bool = year % 100 == 0
    var leap bool = year % 4 == 0
    return year % 400 == 0 || (!century && leap)
}
