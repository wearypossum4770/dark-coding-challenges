import pytest
from easy.triangle_next_edge import triangle_next_edge


@pytest.mark.parametrize(
    "a, b, expected",
    [
        (5, 4, 8),
        (8, 3, 10),
        (7, 9, 15),
        (10, 4, 13),
        (7, 2, 8),
    ],
)
def test_triangle_next_edge(a, b, expected):
    assert triangle_next_edge(a, b) == expected
