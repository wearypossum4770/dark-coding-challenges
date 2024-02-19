import pytest
from easy.palindromic_number import palindromic_number


@pytest.mark.parametrize(
    "num,expected",
    [
        (121, True),
        (-121, False),
        (10, False),
    ],
)
def test_palindromic_number(num, expected):
    assert palindromic_number(num) == expected
