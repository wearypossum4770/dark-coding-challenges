import pytest
from easy.simple_array_sum import simple_array_sum


@pytest.mark.parametrize(
    "num,expected",
    [
        ([1, 2, 3, 4, 10, 11], 31),
    ],
)
def test_simple_array_sum(num, expected):
    assert simple_array_sum(num) == expected
