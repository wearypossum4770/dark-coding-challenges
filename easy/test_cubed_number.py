import pytest
from easy.cubed_number import cubed_number


@pytest.mark.parametrize(
    "num,expected",
    [
        (2, 8),
        (3, 27),
        (4, 64),
        (5, 125),
        (10, 1000),
    ],
)
def test_cubed_number(num, expected):
    assert cubed_number(num) == expected
