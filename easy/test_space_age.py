import pytest
from easy.space_age import space_age
from pytest import approx


@pytest.mark.parametrize(
    "planet, seconds,expected",
    [
        ("earth", 1000000000, 31.69),
        ("mercury", 2134835688, 280.88),
        ("venus", 189839836, 9.78),
        ("mars", 2129871239, 35.88),
        ("jupiter", 901876382, 2.41),
        ("saturn", 2000000000, 2.15),
        ("uranus", 1210123456, 0.46),
        ("neptune", 1821023456, 0.35),
    ],
)
def test_space_age(planet, seconds, expected):
    assert approx(space_age(planet, seconds), rel=1e-2) == expected
