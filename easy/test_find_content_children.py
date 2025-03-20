import pytest
from easy.find_content_children import find_content_children


@pytest.mark.parametrize(
    "children, cookies, expected",
    (
        ([1, 2, 3], [1, 1], 1),
        ([1, 2], [1, 2, 3], 2),
        ([10, 9, 8, 7], [5, 6, 7, 8], 2),
        ([], [1, 2], 0),
        ([1, 2], [], 0),
    ),
)
def test_find_content_children(children, cookies, expected):
    assert find_content_children(children, cookies) == expected
