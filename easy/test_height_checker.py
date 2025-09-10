import pytest
from easy.height_checker import height_checker


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([1, 1, 4, 2, 1, 3], 3),
        ([5, 1, 2, 3, 4], 5),
        ([1, 2, 3, 4, 5], 0),
        (
            [
                10,
                6,
                6,
                10,
                10,
                9,
                8,
                8,
                3,
                3,
                8,
                2,
                1,
                5,
                1,
                9,
                5,
                2,
                7,
                4,
                7,
                7,
            ],
            22,
        ),
    ],
)
def test_height_checker(nums, expected):
    assert height_checker(nums) == expected
