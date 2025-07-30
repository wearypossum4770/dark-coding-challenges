import pytest
from easy.find_the_difference import find_the_difference
@pytest.mark.parametrize("s, t, expected",[
    ("abcd", "abcde", 'e'),
    ("", "y", 'y'),
    ("a", "aa", 'a'),
    ("aabbcc", "aabbccd", 'd'),
])
def test_find_the_difference(s: str, t: str, expected: str):
	assert find_the_difference(s, t) == expected