import pytest
from easy.reverse_string import reverse_string


@pytest.mark.parametrize("word,expected", [
( "", ""),
( "robot", "tobor"),
( "Ramen", "nemaR"),
("I'm hungry!", "!yrgnuh m'I"),
("racecar", "racecar"),
])
def test_reverse_string(word, expected):
    assert reverse_string(word) == expected
