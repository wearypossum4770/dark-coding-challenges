import pytest
from datetime import timedelta, datetime
from easy.next_gigasecond import next_gigasecond


@pytest.mark.parametrize("num,expected", [
(datetime(2011, 4, 25, 0, 0), datetime(2043, 1, 1, 1, 46, 40)),
(datetime(1977, 6, 13, 0, 0), datetime(2009, 2, 19, 1, 46, 40)),
(datetime(1959, 7, 19, 0, 0), datetime(1991, 3, 27, 1, 46, 40)),
(datetime(2015, 1, 24, 22, 0), datetime(2046, 10, 2, 23, 46, 40)),
(datetime(2015, 1, 24, 23, 59, 59), datetime(2046, 10, 3, 1, 46, 39)),
])
def test_next_gigasecond(num, expected):
    assert next_gigasecond(num) == expected

