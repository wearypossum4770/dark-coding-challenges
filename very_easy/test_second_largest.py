import pytest
from very_easy.second_largest import second_largest


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([10, 40, 30, 20, 50], 40),
        ([25, 143, 89, 13, 105], 105),
        ([54, 23, 11, 17, 10], 23),
        ([513, 211, 131, 417, 11], 417),
        ([63, 44, 11, 22, 33, 66, 65], 65),
        ([5, 5, 3], 3),
        ([5, 5, 5, 4], 4),
        ([1, 2, 2, 1], 1),
        ([3, 3, 2, 2, 1], 2),
        ([-1, -2, -3], -2),
        ([-10, -20, -30, -40], -20),
        ([-5, -1, -3], -3),
        ([-10, 0, 10], 0),
        ([0, -1, 1], 0),
        ([-1, -1, 0], -1),
    ],
)
def test_second_largest(nums: list[int], expected: int):
    assert second_largest(nums) == expected
