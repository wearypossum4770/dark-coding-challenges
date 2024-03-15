import pytest
from easy.switch_positions import switch_positions


@pytest.mark.parametrize(
    "switches,expected",
    [
        (5, 32),
        (4, 16),
        (3, 8),
        (2, 4),
        (1, 2),
        (6, 64),
        (7, 128),
        (8, 256),
        (9, 512),
        (10, 1024),
        (25, 33554432),
    ],
)
def test_switch_positions(switches, expected):
    assert switch_positions(switches) == expected
