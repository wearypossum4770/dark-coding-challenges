import pytest
from easy.makes_ten import makes_ten


@pytest.mark.parametrize(
    "a, b, expected",
    [
        (9, 10, True),
        (9, 9, False),
        (1, 9, True),
        (10, 1, True),
        (10, 10, True),
        (8, 2, True),
        (8, 3, False),
        (10, 42, True),
        (12, -2, True),
    ],
)
def test_makes_ten(a, b, expected):
    assert makes_ten(a, b) == expected
