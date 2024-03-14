import pytest
from easy.radians_to_degrees import radians_to_degrees


@pytest.mark.parametrize(
    "radians,expected",
    [
        (1, 57.29577951308232),
        (5, 286.4788975654116),
        (7, 401.07045659157626),
        (100, 5729.5779513082325),
        (180, 10313.240312354817),
    ],
)
def test_radians_to_degrees(radians, expected):
    assert radians_to_degrees(radians) == pytest.approx(expected)
