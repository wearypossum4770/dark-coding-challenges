import pytest
from medium.find_duplicate_number import find_duplicate_number


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([1, 1], 1),
        ([1, 3, 4, 2, 2], 2),
        ([3, 1, 3, 4, 2], 3),
        ([3, 3, 3, 3, 3], 3),
        ([2, 1, 2], 2),
        ([1, 4, 6, 3, 2, 5, 6], 6),
        ([5, 4, 3, 2, 1, 5], 5),
        ([1, 2, 3, 4, 5, 6, 7, 8, 9, 9], 9),
        ([2, 2, 2, 2, 2], 2),
        ([1, 1, 2, 3, 4, 5], 1),
        ([4, 3, 1, 4, 2], 4),
        ([6, 1, 5, 4, 3, 2, 6], 6),
        ([1, 2, 3, 4, 5, 3], 3),
        ([7, 6, 5, 4, 3, 2, 1, 7], 7),
    ],
)
def test_find_duplicate_number(nums, expected):
    assert find_duplicate_number(nums) == expected
