import pytest
from easy.string_is_subsequence import string_is_subsequence


@pytest.mark.parametrize(
    "s, t, expected",
    [
        ("abc", "ahbgdc", True),
        ("", "", True),
        ("", "anything", True),
        ("a", "a", True),
        ("a", "b", False),
        ("z", "abc", False),
        ("acb", "abc", False),
        ("xyz", "abcxyz", True),
        ("aaa", "aaaaaa", True),
        ("aaa", "aa", False),
        ("abc", "abc", True),
        ("abc", "a" + "x" * 9999 + "b" + "y" * 9999 + "c", True),
        ("ace", "abcde", True),
        ("aec", "abcde", False),
        ("axc", "ahbgdc", False),
    ],
)
def test_string_is_subsequence(s: str, t: str, expected: bool):
    assert string_is_subsequence(s, t) == expected
