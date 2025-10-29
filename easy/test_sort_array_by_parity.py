import pytest
from easy.sort_array_by_parity import sort_array_by_parity


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([3, 1, 2, 4], [2, 4, 1, 3]),
        ([0, 1, 2], [0, 2, 1]),
        ([0], [0]),
    ],
)
def test_sort_array_by_parity(nums: list[int], expected: list[int]):
    assert sort_array_by_parity(nums) == expected
