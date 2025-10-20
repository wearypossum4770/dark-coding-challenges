import pytest
from easy.find_lucky import find_lucky


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([2, 2, 3, 4], 2),
        ([1, 2, 2, 3, 3, 3], 3),
        ([2, 2, 2, 3, 3], -1),
    ],
)
def test_find_lucky(nums, expected):
    assert find_lucky(nums) == expected
