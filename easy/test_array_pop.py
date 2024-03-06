import pytest
from easy.array_pop import array_pop


@pytest.mark.parametrize(
    "num,expected",
    [
        ([1, 2, 3], 1),
        ([80, 5, 100], 80),
        ([-500, 0, 50], -500),
        ([5, 2, 3], 5),
        ([75675, 5, 100], 75675),
        ([-52320, 0, 50], -52320),
    ],
)
def test_array_pop(num, expected):
    assert array_pop(num) == expected
