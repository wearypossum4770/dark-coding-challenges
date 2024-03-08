import pytest
from easy.less_than100 import less_than100


@pytest.mark.parametrize(
    "a, b,expected",
    [
        (5, 57, True),
        (77, 30, False),
        (0, 59, True),
        (78, 35, False),
        (63, 11, True),
        (37, 99, False),
        (52, 11, True),
        (82, 95, False),
        (17, 44, True),
        (74, 53, False),
        (3, 77, True),
        (25, 80, False),
        (59, 28, True),
        (69, 87, False),
        (10, 45, True),
        (43, 58, False),
        (50, 44, True),
        (74, 89, False),
        (3, 27, True),
        (21, 79, False),
    ],
)
def test_less_than100(a, b, expected):
    assert less_than100(a, b) == expected
