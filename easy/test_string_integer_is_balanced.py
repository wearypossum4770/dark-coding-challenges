import pytest
from easy.string_integer_is_balanced import string_integer_is_balanced


@pytest.mark.parametrize(
    "nums, expected",
    [
        ("12", False),
        ("11", True),
        ("1234", False),
        ("24123", True),
        ("00", True),
        ("10", False),
        ("1010", False),
        ("909", False),
        ("1234567890", False),
        ("111111", True),
        ("123321", True),
        ("99999999", True),
        ("5005", True),
        ("1234567", False),
        ("1", False),
    ],
)
def test_string_integer_is_balanced(nums: str, expected: bool):
    assert string_integer_is_balanced(nums) == expected
