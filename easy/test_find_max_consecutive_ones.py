import pytest
from easy.find_max_consecutive_ones import find_max_consecutive_ones


@pytest.mark.parametrize(
    "nums, expected",
    [
		([1,1,0,1,1,1], 3),
		([1,0,1,1,0,1], 2),
		([0], 0),
		([1], 1),
		([1, 1, 1, 1], 4),
    ],
)
def test_find_max_consecutive_ones(nums, expected):
    assert find_max_consecutive_ones(nums) == expected
