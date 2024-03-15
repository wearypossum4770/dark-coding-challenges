import pytest
from easy.inches_to_feet import inches_to_feet


@pytest.mark.parametrize(
    "inches,expected",
    [
        (12, 1),
        (360, 30),
        (3612, 301),
        (324, 27),
        (3012, 251),
        (11, 0),
    ],
)
def test_inches_to_feet(inches, expected):
    assert inches_to_feet(inches) == expected
