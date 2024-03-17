import pytest
from easy.years_in_one_house import years_in_one_house


@pytest.mark.parametrize(
    "age, moves,expected",
    [
        (30, 1, 15),
        (15, 2, 5),
        (80, 0, 80),
        (23, 2, 8),
        (31, 2, 10),
        (1, 0, 1),
    ],
)
def test_years_in_one_house(age, moves, expected):
    assert years_in_one_house(age, moves) == pytest.approx(expected)
