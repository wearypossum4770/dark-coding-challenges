import pytest
from easy.find_perimeter import find_perimeter


@pytest.mark.parametrize(
    "length, width, expected",
    [
        (6, 7, 26),
        (20, 10, 60),
        (2, 9, 22),
    ],
)
def test_find_perimeter(length, width, expected):
    assert find_perimeter(length, width) == expected
