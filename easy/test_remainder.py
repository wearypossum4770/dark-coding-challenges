import pytest
from easy.remainder import divisible_by_five, remainder


@pytest.mark.parametrize(
    "a, b, expected",
    [
        (7, 2, 1),
        (3, 4, 3),
        (5, 5, 0),
        (1, 3, 1),
    ],
)
def test_remainder(a, b, expected):
    assert remainder(a, b) == expected


@pytest.mark.parametrize(
    "a, expected",
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
def test_divisible_by_five(a, expected):
    assert divisible_by_five(a) == expected
