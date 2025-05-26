import pytest
from easy.remove_element import remove_element


@pytest.mark.parametrize(
    "nums, subject, expected, actual",
    [
        ([3, 2, 2, 3], 3, 2, [None, 2, 2, None]),
        ([0, 1, 2, 2, 3, 0, 4, 2], 2, 5, [0, 1, None, None, 3, 0, 4, None]),
    ],
)
def test_remove_element(nums, subject, expected, actual):
    result = remove_element(nums, subject)
    assert nums == actual
    assert result == expected
