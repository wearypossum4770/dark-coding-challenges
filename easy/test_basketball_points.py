import pytest
from easy.basketball_points import basketball_points


@pytest.mark.parametrize(
    "two_points, three_points,expected",
    [
        (1, 1, 5),
        (1, 2, 8),
        (2, 1, 7),
        (2, 2, 10),
        (69, 420, 1398),
    ],
)
def test_basketball_points(two_points, three_points, expected):
    assert basketball_points(two_points, three_points) == expected
