import pytest
from easy.remove_duplicate_zeros import remove_duplicate_zeros


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]),
        ([1, 2, 3], [1, 2, 3]),
        ([0, 0, 0], [0, 0, 0]),
        ([0], [0]),
        ([7], [7]),
        ([1, 2, 0], [1, 2, 0]),
        ([0, 1, 0, 2, 0, 3], [0, 0, 1, 0, 0, 2]),
    ],
)
def test_remove_duplicate_zeros(nums: list[int], expected: list[int]):
    remove_duplicate_zeros(nums)
    assert nums == expected
