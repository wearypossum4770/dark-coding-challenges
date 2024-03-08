import pytest
from easy.print_array import print_array


@pytest.mark.parametrize(
    "size,expected",
    [
        (1, [1]),
        (2, [1, 2]),
        (3, [1, 2, 3]),
        (4, [1, 2, 3, 4]),
        (5, [1, 2, 3, 4, 5]),
        (6, [1, 2, 3, 4, 5, 6]),
        (7, [1, 2, 3, 4, 5, 6, 7]),
        (8, [1, 2, 3, 4, 5, 6, 7, 8]),
        (9, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
        (10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
    ],
)
def test_print_array(size, expected):
    assert print_array(size) == expected
