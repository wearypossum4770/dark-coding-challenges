import pytest
from easy.reverse_vowels import reverse_vowels


@pytest.mark.parametrize(
    "nums, expected",
    [
        ("IceCreAm", "AceCreIm"),
        ("leetcode", "leotcede"),
        ("a", "a"),
        ("b", "b"),
        ("a.", "a."),
        ("AEIOU", "UOIEA"),
        ("aeiou", "uoiea"),
        ("bcdfgh", "bcdfgh"),
        ("A man, a plan, a canal: Panama", "a man, a plan, a canal: PanamA"),
        ("aA", "Aa"),
        ("a.b,e", "e.b,a"),
        ("hello world", "hollo werld"),
        ("aEiOu", "uOiEa"),
        (".,?!", ".,?!"),
        ("aaaaaa", "aaaaaa"),
        ("aAaaAa", "aAaaAa"),
    ],
)
def test_reverse_vowels(nums, expected):
    assert reverse_vowels(nums) == expected
