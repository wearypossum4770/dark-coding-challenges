import pytest
from easy.farm_animals import farm_animals


@pytest.mark.parametrize("num,expected", [])
def test_farm_animals(num, expected):
    assert farm_animals(num) == expected
