import pytest
from easy.summation import summation


@pytest.mark.parametrize(
    "addendOne, addendTwo,expected",
    [
        (1, 3, 4),
        (3, 4, 7),
    ],
)
def test_summation(addendOne, addendTwo, expected):
    assert summation(addendOne, addendTwo) == expected
