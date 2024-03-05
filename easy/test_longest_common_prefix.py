import pytest
from easy.longest_common_prefix import longest_common_prefix


@pytest.mark.parametrize(
    "num,expected",
    [
        (["flower", "flow", "flight"], "fl"),
        (["dog", "racecar", "car"], ""),
        (["", "b"], ""),
        (["a"], "a"),
        (["flower", "flower", "flower", "flower"], "flower"),
    ],
)
def test_longest_common_prefix(num, expected):
    assert longest_common_prefix(num) == expected
