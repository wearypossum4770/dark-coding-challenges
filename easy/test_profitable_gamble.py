import pytest
from easy.profitable_gamble import profitable_gamble


@pytest.mark.parametrize(
    "probability, prize, cost,expected",
    [
        (0.2, 50, 9, True),
        (0.9, 1, 2, False),
        (0.9, 3, 2, True),
        (0.33, 10, 3.30, True),
        (0, 1000, 0.01, False),
        (0.1, 1000, 7, True),
        (0, 0, 0, False),
    ],
)
def test_profitable_gamble(probability, prize, cost, expected):
    assert profitable_gamble(probability, prize, cost) == expected
