import pytest
from easy.cubed_number import calculate_exponent, cubed_number


@pytest.mark.parametrize(
    "base, exponent ,expected",
    [
        (5, 5, 3125),
        (3, 3, 27),
        (10, 10, 10000000000),
    ],
)
def test_calculate_exponent(base, exponent, expected):
    assert calculate_exponent(base, exponent) == expected


@pytest.mark.parametrize(
    "num,expected",
    [
        (2, 8),
        (3, 27),
        (4, 64),
        (5, 125),
        (10, 1000),
    ],
)
def test_cubed_number(num, expected):
    assert cubed_number(num) == expected
