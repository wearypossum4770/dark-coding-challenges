import pytest
from easy.number_squared import number_squared


@pytest.mark.parametrize(
    "num,expected, message",
    [
        (10, 100, "Expected 100"),
        (69, 4761, "Expected 4761"),
        (666, 443556, "Expected 443556"),
        (-21, 441, "Expected 441"),
        (21, 441, "Expected 441"),
    ],
)
def test_number_squared(num, expected, message):
    assert number_squared(num) == expected
