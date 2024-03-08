import pytest
from easy.remainder import remainder


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
