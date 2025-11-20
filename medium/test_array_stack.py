import pytest
from medium.array_stack import array_stack


@pytest.mark.parametrize(
    "num, n, expected",
    [
        ([1, 3], 3, ["Push", "Push", "Pop", "Push"]),
        ([1, 2, 3], 3, ["Push", "Push", "Push"]),
        ([1, 2], 4, ["Push", "Push"]),
        ([1], 1, ["Push"]),
        ([1], 100, ["Push"]),
        ([2], 2, ["Push", "Pop", "Push"]),
        ([3], 3, ["Push", "Pop", "Push", "Pop", "Push"]),
        ([2, 3, 4], 4, ["Push", "Pop", "Push", "Push", "Push"]),
        (
            [1, 3, 5, 7],
            7,
            [
                "Push",
                "Push",
                "Pop",
                "Push",
                "Push",
                "Pop",
                "Push",
                "Push",
                "Pop",
                "Push",
            ],
        ),
        (
            [5],
            5,
            [
                "Push",
                "Pop",
                "Push",
                "Pop",
                "Push",
                "Pop",
                "Push",
                "Pop",
                "Push",
            ],
        ),
        (
            [4, 5],
            5,
            ["Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Push"],
        ),
        ([1, 2, 4], 4, ["Push", "Push", "Push", "Pop", "Push"]),
    ],
)
def test_array_stack(num: list[int], n: list[int], expected: list[str]):
    assert array_stack(num, n) == expected
