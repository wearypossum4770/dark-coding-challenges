from sys import maxsize

import pytest
from easy.running_array_sum import running_array_sum


@pytest.mark.parametrize(
    "criteria, nums, expected",
    [
        ("✅ Normal case", [1, 2, 3, 4], [1, 3, 6, 10]),
        ("✅ All 1s", [1, 1, 1, 1, 1], [1, 2, 3, 4, 5]),
        ("✅ Mixed values", [3, 1, 2, 10, 1], [3, 4, 6, 16, 17]),
        ("🟢 Empty array", [], []),
        ("🟢 Single element", [5], [5]),
        ("🟢 Negative numbers", [-1, -2, -3], [-1, -3, -6]),
        ("🟢 Large values", [maxsize, 1], [maxsize, maxsize + 1]),
        (
            "🟢 Alternating positives & negatives",
            [1, -1, 1, -1, 1],
            [1, 0, 1, 0, 1],
        ),
    ],
)
def test_running_array_sum(
    criteria: str, nums: list[int], expected: list[int]
):
    assert running_array_sum(nums) == expected
