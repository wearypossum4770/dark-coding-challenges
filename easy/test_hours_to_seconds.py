import pytest
from easy.hours_to_seconds import hours_to_seconds


@pytest.mark.parametrize(
    "hours,expected",
    [
        (2, 7200),
        (10, 36000),
        (24, 86400),
        (36, 129600),
    ],
)
def test_hours_to_seconds(hours, expected):
    assert hours_to_seconds(hours) == expected
