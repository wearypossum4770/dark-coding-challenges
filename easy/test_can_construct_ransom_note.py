import pytest
from easy.can_construct_ransom_note import can_construct_ransom_note


@pytest.mark.parametrize(
    "note, magazine, expected",
    [
        ("a", "b", False),
        ("aa", "aab", True),
        ("a", "a", True),
        ("aa", "ab", False),
        ("abc", "cbad", True),
        ("", "anything", True),
        ("a", "", False),
        ("", "", True),
        ("aA", "aa", True),
        ("Aa", "aA", True),
        ("zzz", "zzzzzz", True),
        ("zzzz", "zzz", False),
        ("hello world", "dlrow olleh", True),
    ],
)
def test_can_construct_ransom_note(note: str, magazine: str, expected: bool):
    assert can_construct_ransom_note(note, magazine) == expected
