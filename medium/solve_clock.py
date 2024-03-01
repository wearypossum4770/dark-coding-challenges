class Clock:
    def __init__(self, hour, minute):
        self.total = hour * 60 + minute
        self.hours = hour
        self.minutes = minute
        self.build()

    def build(self):
        self.hours = (self.total // 60) % 24
        self.minutes = self.total % 60

    def __repr__(self):
        self.build()
        return f"{self.__class__.__name__}({self.hours}, {self.minutes})"

    def __str__(self):
        self.build()
        return f"{self.hours:02d}:{self.minutes:02d}"

    def __eq__(self, other):
        return all([self.hours_equal(other), self.minutes_equal(other)])

    def hours_equal(self, other):
        return self.hours == other.hours

    def minutes_equal(self, other):
        return self.minutes == other.minutes

    def __add__(self, minutes):
        if minutes is not None:
            self.total += minutes
            self.build()
        return self

    def __sub__(self, minutes):
        if minutes is not None:
            self.total -= minutes
            self.build()
        return self
