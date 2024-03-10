import pytest
from easy.make_pair import make_pair


@pytest.mark.parametrize(
    "a, b,expected",
    [
        (1, 2, [1, 2]),
        (21, 82, [21, 82]),
        (4213, 526, [4213, 526]),
    ],
)
def test_make_pair(a, b, expected):
    assert make_pair(a, b) == expected
