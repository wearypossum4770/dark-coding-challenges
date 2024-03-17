import pytest
from easy.shape_area import shape_area


@pytest.mark.parametrize(
    "a, b, shape, expected",
    [
        (2, 3, "triangle", 3),
        (8, 6, "parallelogram", 48),
        (0, 1, "triangle", 0),
        (2.9, 1.3, "parallelogram", 3.77),
        (0.01, 5, "triangle", 0.025),
    ],
)
def test_shape_area(a, b, shape, expected):
    assert shape_area(a, b, shape) == expected
