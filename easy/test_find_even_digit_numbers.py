import pytest
from easy.find_even_digit_numbers import find_even_digit_numbers


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([12, 345, 2, 6, 7896], 2),
        ([555, 901, 482, 1771], 1),
    ],
)
def test_find_even_digit_numbers(nums: list[int], expected: int):
    assert find_even_digit_numbers(nums) == expected
