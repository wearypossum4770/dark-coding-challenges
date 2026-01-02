import pytest
from easy.rotate_string import rotate_string


@pytest.mark.parametrize(
    "s, goal, expected",
    [
        ("abcde", "cdeab", True),
        ("abcde", "eabcd", True),
        ("abcde", "abcde", True),
        ("abcde", "abced", False),
        ("abcde", "edcba", False),
        ("aa", "a", False),
        ("a", "aa", False),
        ("abc", "abcd", False),
        ("aaaa", "aaaa", True),
        ("aabb", "bbaa", True),
        ("aabb", "abab", False),
        ("aabb", "abba", True),
        ("defdefdefabcabc", "defdefabcabcdef", True),
        ("bbbacddceeb", "ceebbbbacdd", True),
        ("a", "a", True),
        ("a", "b", False),
        ("", "", True),
        ("abcabc", "bcabca", True),
        ("abcabc", "cabacb", False),
    ],
)
def test_rotate_string(s, goal, expected):
    assert rotate_string(s, goal) == expected
