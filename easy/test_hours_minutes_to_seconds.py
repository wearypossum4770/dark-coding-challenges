import pytest
from easy.hours_minutes_to_seconds import hours_minutes_to_seconds


@pytest.mark.parametrize(
    "hours, minutes,expected",
    [
        (1, 0, 3_600),
        (1, 3, 3_780),
        (0, 30, 1_800),
    ],
)
def test_hours_minutes_to_seconds(hours, minutes, expected):
    assert hours_minutes_to_seconds(hours, minutes) == expected
