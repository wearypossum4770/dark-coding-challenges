import pytest
from easy.plus_one import plus_one


@pytest.mark.parametrize(
    "num,expected",
    [
        ([1, 2, 3], [1, 2, 4]),
        ([4, 3, 2, 1], [4, 3, 2, 2]),
        ([9], [1, 0]),
        ([0], [1]),
        ([1, 8], [1, 9]),
        ([1, 9], [2, 0]),
        ([9, 9], [1, 0, 0]),
    ],
)
def test_plus_one(num, expected):
    assert plus_one(num) == expected
