import pytest
from medium.solve_clock import Clock


# fmt: off
@pytest.mark.parametrize(
    "hours, minutes, expected",
    [
		(12, 0, "Clock(12, 0)"),
		(6, 45, "Clock(6, 45)"),
		(18, 30, "Clock(18, 30)"),
    ],
)
# fmt: on
def test_clock_representation(hours, minutes, expected):
    assert repr(Clock(hours, minutes)) == expected


# fmt: off
@pytest.mark.parametrize(
    "hours, minutes, expected",
    [
		(8, 0, "08:00"),
		(11, 9, "11:09"),
		(24, 0, "00:00"),
		(25, 0, "01:00"),
        (100, 0, "04:00"),
        (1, 60, "02:00"),
        (0, 160, "02:40"),
        (0, 1723, "04:43"),
        (25, 160, "03:40"),
        (201, 3001, "11:01"),
        (72, 8640, "00:00"),
        (-1, 15, "23:15"),
        (-25, 0, "23:00"),
        (-91, 0, "05:00"),
        (1, -40, "00:20"),
        (1, -160, "22:20"),
        (1, -4820, "16:40"),
        (2, -60, "01:00"),
        (-25, -160, "20:20"),
        (-121, -5810, "22:10"),
    ],
)
# fmt: on
def test_solve_clock_string(hours, minutes, expected):
    assert str(Clock(hours, minutes)) == expected


def test_add_minutes():
    assert str(Clock(10, 0) + 3) == "10:03"


@pytest.mark.parametrize(
    "hours, minutes, addend, expected",
    [
        (6, 41, 0, "06:41"),
        (0, 45, 40, "01:25"),
        (10, 0, 61, "11:01"),
        (0, 45, 160, "03:25"),
        (23, 59, 2, "00:01"),
        (5, 32, 1500, "06:32"),
        (1, 1, 3500, "11:21"),
        (10, 3, -3, "10:00"),
        (10, 3, -30, "09:33"),
        (10, 3, -70, "08:53"),
        (0, 3, -4, "23:59"),
        (0, 0, -160, "21:20"),
        (6, 15, -160, "03:35"),
        (5, 32, -1500, "04:32"),
        (2, 20, -3000, "00:20"),
    ],
)
def test_time_math(hours, minutes, addend, expected):
    clock = Clock(hours, minutes)
    clock + addend
    assert str(clock) == expected


@pytest.mark.parametrize(
    "firstHours, firstMinutes, secondHours, secondMinutes",
    [
        (15, 37, 15, 37),
        (10, 37, 34, 37),
        (3, 11, 99, 11),
        (22, 40, -2, 40),
        (17, 3, -31, 3),
        (13, 49, -83, 49),
        (0, 1, 0, 1441),
        (2, 2, 2, 4322),
        (2, 40, 3, -20),
        (4, 10, 5, -1490),
        (6, 15, 6, -4305),
        (7, 32, -12, -268),
        (18, 7, -54, -11513),
        (24, 0, 0, 0),
    ],
)
def test_clock_equality(firstHours, firstMinutes, secondHours, secondMinutes):
    assert Clock(firstHours, firstMinutes) == Clock(secondHours, secondMinutes)


@pytest.mark.parametrize(
    "firstHours, firstMinutes, secondHours, secondMinutes",
    [(15, 36, 15, 37), (14, 37, 15, 37)],
)
def test_clock_inequality(firstHours, firstMinutes, secondHours, secondMinutes):
    assert Clock(firstHours, firstMinutes) != Clock(secondHours, secondMinutes)
