
import pytest
from easy.number_squared import number_squared
@pytest.mark.parametrize("num,expected",[])
def test_number_squared(num, expected):
	assert number_squared(num) == expected