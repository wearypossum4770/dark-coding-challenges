import pytest
from easy.increment_items import increment_items


@pytest.mark.parametrize(
    "items,expected",
    [
        ([0, 1, 2, 3], [1, 2, 3, 4]),
        ([2, 4, 6, 8], [3, 5, 7, 9]),
        ([-1, -2, -3, -4], [0, -1, -2, -3]),
    ],
)
def test_increment_items(items, expected):
    assert increment_items(items) == expected
