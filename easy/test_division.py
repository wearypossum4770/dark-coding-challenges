import pytest
from easy.division import division


@pytest.mark.parametrize(
    "dividend, divisor,quotient",
    [
        (12, 4, 3),
        (3, 0, float("inf")),
    ],
)
def test_division(dividend, divisor, quotient):
    assert division(dividend, divisor) == quotient
