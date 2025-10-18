import pytest
from easy.plus_one import plus_one


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([4, 3, 2, 1], [4, 3, 2, 2]),
        ([1, 2, 3], [1, 2, 4]),
        ([9], [1, 0]),
        ([9, 9], [1, 0, 0]),
        ([0], [1]),
        ([5], [6]),
        ([9, 9, 9, 9], [1, 0, 0, 0, 0]),
        ([9, 9, 8], [9, 9, 9]),
        ([1, 0, 0], [1, 0, 1]),
        ([8, 9, 9], [9, 0, 0]),
        ([0, 9], [1, 0]),
        ([1, 9, 9], [2, 0, 0]),
        ([9, 9, 9, 9, 9], [1, 0, 0, 0, 0, 0]),
    ],
)
def test_plus_one(nums: list[int], expected: list[int]):
    assert plus_one(nums) == expected
