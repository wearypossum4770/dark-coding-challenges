import pytest
from easy.is_boomerang import is_boomerang


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([[1, 1], [2, 3], [3, 2]], True),
        ([[1, 1], [2, 2], [3, 3]], False),
        ([[1, 0], [0, 0], [2, 0]], False),
        ([[0, 1], [0, 2], [1, 2]], True),
    ],
)
def test_is_boomerang(nums: list[list[int]], expected: bool):
    assert is_boomerang(nums) == expected
