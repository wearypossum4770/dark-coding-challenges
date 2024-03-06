
import pytest
from easy.remainder import remainder
@pytest.mark.parametrize("num,expected",[])
def test_remainder(num, expected):
	assert remainder(num) == expected