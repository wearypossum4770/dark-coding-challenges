import pytest
from easy.detect_capital_use import detect_capital_use


@pytest.mark.parametrize(
    "word, expected",
    [
        ("USA", True),
        ("UsA", False),
        ("leetcode", True),
        ("Google", True),
        ("FlaG", False),
        ("g", True),
        ("G", True),
        ("LeetCode", False),
        ("aPPle", False),
        ("APPLE", True),
        ("apple", True),
        ("Apple", True),
        ("AppLe", False),
        ("zZZ", False),
        ("HELlo", False),
        ("qwerty", True),
        ("Qwerty", True),
        ("QWERTY", True),
        ("QwErTy", False),
        ("Abcdefg", True),
        ("abcdEfg", False),
    ],
)
def test_detect_capital_use(word, expected):
    assert detect_capital_use(word) == expected
