import pytest
from medium.pairs import pairs


@pytest.mark.parametrize(
    "arr, k, expected",
    (
        ([1, 5, 3, 4, 2], 2, 3),
        # fmt: off
		([363374326, 364147530, 61825163, 1073065718, 1281246024, 1399469912, 428047635, 491595254, 879792181, 1069262793], 1, 0 ),
        # fmt: on
        ([1, 3, 5, 8, 6, 4, 2], 2, 5),
    ),
)
def test_pairs(arr, k, expected):
    assert pairs(k, arr) == expected
