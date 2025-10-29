import pytest
from easy.sort_array_by_parity_two import sort_array_by_parity_two


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([4, 2, 5, 7], [4, 5, 2, 7]),
        ([2, 3], [2, 3]),
    ],
)
def test_sort_array_by_parity_two(nums: list[int], expected: list[int]):
    assert sort_array_by_parity_two(nums) == expected
