import pytest
from easy.find_largest_altitude import find_largest_altitude


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([-5, 1, 5, 0, -7], 1),
        ([-4, -3, -2, -1, 4, 3, 2], 0),
        ([0], 0),
        ([100], 100),
        ([-100], 0),
        ([1], 1),
        ([0, 0, 0, 0], 0),
        ([1, 2, 3, 4, 5], 15),
        ([-1, -2, -3, -4, -5], 0),
        ([5, 5, 5, 5], 20),
        ([-5, -5, -5, -5], 0),
        ([10, -20, 10], 10),
        ([1, 1, 1, 1, -100], 4),
        ([-100, 1, 1, 1, 1], 0),
        ([50, -100, 50, -100, 50], 50),
        ([100, -100, -100, -100], 100),
        ([-1, -1, -1, 1, 1], 0),
        ([1, -1, 1, -1, 1, -1], 1),
        ([1, 1, 1, 1, 1], 5),
        ([-100], 0),
        ([100], 100),
    ],
)
def test_find_largest_altitude(nums: list[int], expected: int):
    assert find_largest_altitude(nums) == expected
