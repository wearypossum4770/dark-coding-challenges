import pytest
from easy.find_words_containing import find_words_containing


@pytest.mark.parametrize(
    "words, char, expected",
    [
        (["abc", "bcd", "aaaa", "cbc"], "a", [0, 2]),
        (["leet", "code"], "e", [0, 1]),
        (["abc", "bcd", "aaaa", "cbc"], "z", []),
    ],
)
def test_find_words_containing(
    words: list[str], char: str, expected: list[int]
):
    assert find_words_containing(words, char) == expected
