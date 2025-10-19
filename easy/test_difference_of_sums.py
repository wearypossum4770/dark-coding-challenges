import pytest
from easy.difference_of_sums import difference_of_sums


@pytest.mark.parametrize(
    "n, m, expected",
    [
        (10, 3, 19),
        (5, 6, 15),
        (5, 1, -15),
    ],
)
def test_difference_of_sums(n: int, m: int, expected: int):
    assert difference_of_sums(n, m) == expected
