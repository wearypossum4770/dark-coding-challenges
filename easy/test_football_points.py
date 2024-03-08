import pytest
from easy.football_points import football_points


@pytest.mark.parametrize(
    "wins, draws, losses,expected",
    [
        (1, 2, 3, 5),
        (5, 5, 5, 20),
        (1, 0, 0, 3),
        (0, 7, 0, 7),
        (0, 0, 15, 0),
    ],
)
def test_football_points(wins, draws, losses, expected):
    assert football_points(wins, draws, losses) == expected
