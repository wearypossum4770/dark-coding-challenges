
import pytest
from easy.next_integer import next_integer
@pytest.mark.parametrize("num,expected, _rule",[
(2, 3, "2 plus 1 equals 3."),
(-9, -8, "-8 plus 1 equals -9."),
(0, 1, "0 plus 1 equals 1."),
(999, 1000, "999 plus 1 equals 1000."),
(73, 74, "73 plus 1 equals 74."),
])
def test_next_integer(num, expected, _rule):
	print(_rule)
	assert next_integer(num) == expected