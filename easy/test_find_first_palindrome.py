import pytest
from easy.find_first_palindrome import find_first_palindrome


@pytest.mark.parametrize(
    "nums, expected",
    [
        (["abc", "car", "ada", "racecar", "cool"], "ada"),
        (["notapalindrome", "racecar"], "racecar"),
        (["def", "ghi"], ""),
    ],
)
def test_find_first_palindrome(nums: list[str], expected: str):
    assert find_first_palindrome(nums) == expected
