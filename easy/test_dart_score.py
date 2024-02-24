import pytest
from easy.dart_score import dart_score


@pytest.mark.parametrize(
    "x, y,expected",
    [
        (-9.0, 9.0, 0),
        (0.0, 10.0, 1),
        (-5.0, 0.0, 5),
        (0.0, -1.0, 10),
        (0.0, 0.0, 10),
        (-0.1, -0.1, 10),
        (0.7, 0.7, 10),
        (0.8, -0.8, 5),
        (-3.5, 3.5, 5),
        (-3.6, -3.6, 1),
        (-7.0, 7.0, 1),
        (7.1, -7.1, 0),
        (
            0.5,
            -4.0,
            5,
        ),
    ],
)
def test_dart_score(x, y, expected):
    assert dart_score(x, y) == expected
