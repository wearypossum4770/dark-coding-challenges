import pytest
from easy.reverse_string import reverse_string


@pytest.mark.parametrize(
    "s, expected",
    [
        (["h", "e", "l", "l", "o"], ["o", "l", "l", "e", "h"]),
        (["a", "b", "c", "d"], ["d", "c", "b", "a"]),
        (["z"], ["z"]),
        ([], []),
    ],
)
def test_reverse_string(s, expected):
    reverse_string(s)
    assert s == expected
