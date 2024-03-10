
import pytest
from easy.geometry import rectangle_area
@pytest.mark.parametrize("length, width,expected",[
(5, 3, 15),
(8, 5, 40),
(5, 4, 20),
(2, 3, 6),
(10_000, 10_000, 100_000_000),
(-2, -5, -1),
(0, 3, -1),
(5, -3, -1),
(0, 1, -1),
(-1, 0, -1),
])
def test_rectangle_area(length, width, expected):
	assert rectangle_area(length, width) == expected