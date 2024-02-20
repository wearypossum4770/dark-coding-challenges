
import pytest
from easy.is_leap_year import is_leap_year
@pytest.mark.parametrize("year,expected",[
(2015, False),
(1970, False),
(1996, True),
(1960, True),
(2100, False),
(1900, False),
(2000, True),
(2400, True),
(1800, False),

])
def test_is_leap_year(year, expected):
	assert is_leap_year(year) == expected