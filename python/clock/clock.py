# The clock wraps from 23:59 to 00:00
MAX_MINUTES = (24 * 60)
class Clock:
    def __init__(self, hour, minute):
        self.raw_minutes = (hour * 60) + minute

    def __str__(self):
        h = self.minutes // 60
        m = self.minutes % 60
        return "{:02}:{:02}".format(h, m)

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            return self.minutes == other.minutes
        else:
            False

    def add(self, minutes):
        return Clock(0, self.minutes + minutes)

    @property
    def minutes(self):
        """
        Number of minutes on the clock, wrapped to number of minutes in the
        day.
        """
        return self.raw_minutes % MAX_MINUTES

