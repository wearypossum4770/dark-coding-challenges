import pytest
from easy.remainder import divides_evenly, divisible_by_five, remainder


@pytest.mark.parametrize(
    "numerator, denominator, expected",
    [
        (7, 2, 1),
        (3, 4, 3),
        (5, 5, 0),
        (1, 3, 1),
    ],
)
def test_remainder(numerator, denominator, expected):
    assert remainder(numerator, denominator) == expected


@pytest.mark.parametrize(
    "numerator, expected",
    [
        (7, False),
        (5, True),
        (15, True),
        (33, False),
        (-18, False),
        (999, False),
        (2, False),
    ],
)
def test_divisible_by_five(numerator, expected):
    assert divisible_by_five(numerator) == expected


@pytest.mark.parametrize(
    "numerator, denominator, expected",
    [
        (98, 7, True),
        (87, 49, False),
        (34, 14, False),
        (78, 6, True),
        (30, 4, False),
        (87, 73, False),
        (74, 7, False),
        (87, 29, True),
        (48, 24, True),
        (99, 20, False),
        (98, 49, True),
        (100, 6, False),
        (64, 4, True),
        (70, 35, True),
        (38, 38, True),
        (29, 3, False),
        (20, 8, False),
        (66, 50, False),
        (95, 1, True),
        (58, 2, True),
    ],
)
def test_divides_evenly(numerator, denominator, expected):
    assert divides_evenly(numerator, denominator) == expected
