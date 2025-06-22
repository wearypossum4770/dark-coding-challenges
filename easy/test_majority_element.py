import pytest
from easy.majority_element import majority_element


@pytest.mark.parametrize(
    "nums, expected",
    (
        ([2, 1, 2], 2),
        ([100], 100),
        ([2, 1, 1], 1),
        ([3,2,3], 3),
        ([2,2,1,1,1,2,2], 2),
    ),
)
def test_majority_element(nums, expected):
    assert majority_element(nums) == expected
