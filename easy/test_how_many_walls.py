import pytest
from easy.how_many_walls import how_many_walls


@pytest.mark.parametrize(
    "walls, width, height, expected",
    [
        (100, 4, 5, 5),
        (10, 15, 12, 0),
        (41, 3, 6, 2),
        (50, 11, 5, 0),
        (1, 1, 1, 1),
    ],
)
def test_how_many_walls(walls, width, height, expected):
    assert how_many_walls(walls, width, height) == pytest.approx(expected)
