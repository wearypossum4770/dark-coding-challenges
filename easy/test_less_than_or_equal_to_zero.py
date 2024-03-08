import pytest
from easy.less_than_or_equal_to_zero import less_than_or_equal_to_zero


@pytest.mark.parametrize(
    "num,expected",
    [
        (5, False),
        (0, True),
        (-5, True),
    ],
)
def test_less_than_or_equal_to_zero(num, expected):
    assert less_than_or_equal_to_zero(num) == expected
