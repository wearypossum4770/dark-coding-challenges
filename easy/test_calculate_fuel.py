import pytest
from easy.calculate_fuel import calculate_fuel


@pytest.mark.parametrize(
    "distance,expected",
    [
        (15, 150),
        (23, 230),
        (10, 100),
        (3, 100),
        (23.5, 235),
        (3.14, 100),
        (9.99999, 100),
        (822315322, 8223153220),
        (12345.6789, 123456.789),
        (31.41, 314.1),
    ],
)
def test_calculate_fuel(distance, expected):
    assert calculate_fuel(distance) == expected
