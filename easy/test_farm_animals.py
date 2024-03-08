import pytest
from easy.farm_animals import farm_animals


@pytest.mark.parametrize(
    "chickens, cows, pigs,expected",
    [
        (5, 2, 8, 50),
        (3, 4, 7, 50),
        (1, 2, 3, 22),
        (3, 5, 2, 34),
    ],
)
def test_farm_animals(chickens, cows, pigs, expected):
    assert farm_animals(chickens, cows, pigs) == expected
