import pytest
from easy.two_sum import two_sum


@pytest.mark.parametrize(
    "nums,target,expected",
    [
        ([3, 2, 4], 6, [1, 2]),
        ([2, 7, 11, 15], 9, [0, 1]),
        ([3, 3], 6, [0, 1]),
    ],
)
def test_two_sum(nums, target, expected):
    assert two_sum(nums, target) == expected
