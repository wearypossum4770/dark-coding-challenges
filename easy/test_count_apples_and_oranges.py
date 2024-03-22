import pytest
from easy.count_apples_and_oranges import count_apples_and_oranges


@pytest.mark.parametrize(
    "s,t,a,b, m,n,apples, oranges,expected",
    [
        (7, 10, 4, 12, 0, 0, [2, 3, -4], [3, -2, -4], [1, 2]),
        (7, 11, 5, 15, 3, 2, [-2, 2, 1], [5, -6], [1, 1]),
        (2, 3, 1, 5, 1, 1, [-2], [-1], [0, 0]),
        (2, 3, 1, 5, 1, 1, [2], [-2], [1, 1]),
    ],
)
def test_count_apples_and_oranges(s, t, a, b, m, n, apples, oranges, expected):
    assert count_apples_and_oranges(s, t, a, b, m, n, apples, oranges) == expected
