import pytest
from easy.distribute_candies import distribute_candies


@pytest.mark.parametrize(
    "criteria, nums, expected",
    [
        ("3 unique, can eat 3", [1, 1, 2, 2, 3, 3], 3),
        ("3 unique, can eat 2", [1, 1, 2, 3], 2),
        ("1 unique, can eat 2 → only 1 type", [6, 6, 6, 6], 1),
        ("6 unique, can eat 3", [1, 2, 3, 4, 5, 6], 3),
        ("1 unique", [1, 1], 1),
        ("no candies → can't eat any", [], 0),
        ("<constraint non-conforming> 1 candy only", [1], 0),
        ("2 unique, can eat 1", [1, 2], 1),
        ("4 unique, can eat 3 → can only pick 3", [1, 2, 3, 4, 1, 2], 3),
        ("All same but odd count → 1 type only", [5, 5, 5, 5, 5], 1),
        ("Half unique > half total", [1, 2, 3, 4, 4, 4], 3),
        ("Many duplicates, few unique", [1, 1, 1, 2, 2, 2, 3, 3], 3),
        ("Alternate pattern, even size", [1, 2, 1, 2, 3, 3], 3),
        ("Alternate pattern, odd size", [1, 2, 1, 2, 3], 2),
    ],
)
def test_distribute_candies(criteria: str, nums: list[int], expected: int):
    assert distribute_candies(nums) == expected
