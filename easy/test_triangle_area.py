
import pytest
from easy.triangle_area import triangle_area
@pytest.mark.parametrize("base, height, expected",[
(3, 2, 3),
(5, 4, 10),
(10, 10, 50),
(0, 60, 0),
(12, 11, 66),
])
def test_triangle_area(base, height,  expected):
	assert triangle_area(base, height) == expected