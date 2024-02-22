import pytest
from easy.find_digits import find_digits


@pytest.mark.parametrize(
    "num,expected",
    [
        (124, 3),
        (111, 3),
        (12, 2),
        (1012, 3),
        (123456789, 3),
        (114108089, 3),
        (110110015, 6),
        (121, 2),
        (33, 2),
        (44, 2),
        (55, 2),
        (66, 2),
        (77, 2),
        (88, 2),
        (106108048, 5),
    ],
)
def test_find_digits(num, expected):
    assert find_digits(num) == expected
