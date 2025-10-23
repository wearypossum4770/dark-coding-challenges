import pytest
from easy.num_identical_pairs import num_identical_pairs


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([1, 1, 1, 1], 6),
        ([1, 2, 3], 0),
        ([1, 2, 3, 1, 1, 3], 4),
    ],
)
def test_num_identical_pairs(nums: list[int], expected: bool):
    assert num_identical_pairs(nums) == expected
