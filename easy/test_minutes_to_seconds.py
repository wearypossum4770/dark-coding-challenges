import pytest
from easy.minutes_to_seconds import minutes_to_seconds


@pytest.mark.parametrize(
    "minutes, expected",
    [
        (6, 360),
        (4, 240),
        (8, 480),
        (60, 3600),
    ],
)
def test_minutes_to_seconds(minutes, expected):
    assert minutes_to_seconds(minutes) == expected
