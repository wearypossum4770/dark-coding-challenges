import pytest
from easy.give_me_something import give_me_something


@pytest.mark.parametrize(
    "word,expected",
    [
        ("a", "something a"),
        ("is cooking", "something is cooking"),
        (" is cooking", "something  is cooking"),
    ],
)
def test_give_me_something(word, expected):
    assert give_me_something(word) == expected
