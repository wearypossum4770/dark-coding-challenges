import pytest
from easy.leap_year import leap_year


@pytest.mark.parametrize(
    "year,expected",
    [
        (1850, False),
        (1565, False),
        (1920, True),
        (1924, True),
        (1928, True),
        (1940, True),
        (2021, False),
        (2004, True),
        (8, True),
        (4, True),
        (2019, False),
        (1970, False),
        (1934, False),
        (1874, False),
        (1968, True),
    ],
)
def test_leap_year(year, expected):
    assert leap_year(year) == expected
