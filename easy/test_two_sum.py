import pytest
from easy.two_sum import two_sum


@pytest.mark.parametrize(
    "criteria, target, nums, output",
    (
        ("twoSum with integers", 9, [2, 7, 11, 15], (0, 1)),
        ("two sum simple increasing sequence", 9, [2, 7, 11, 15], (0, 1)),
        ("two sum unordered elements", 6, [3, 2, 4], (1, 2)),
        ("two sum duplicate values", 6, [3, 3], (0, 1)),
        ("two sum mirrored elements", 6, [3, 2, 3], (0, 2)),
        ("two sum inner duplicates", 10, [2, 5, 5, 11], (1, 2)),
        ("two sum outer duplicates", 0, [0, 4, 3, 0], (0, 3)),
        ("two sum crossing zero", 0, [-3, 4, 3, 90], (0, 2)),
        ("two sum descending negatives", -8, [-1, -2, -3, -4, -5], (2, 4)),
        ("two sum large numbers", 100, [5, 75, 25], (1, 2)),
        (
            "two sum identical large numbers",
            4444444,
            [2222222, 2222222],
            (0, 1),
        ),
        ("two sum sparse high values", 18431, [1, 6142, 8192, 10239], (2, 3)),
        ("two sum mixed negatives", -19, [-10, -1, -18, -19], (1, 2)),
        ("two sum mixed positive and negative", 9, [-10, 7, 19, 15], (0, 2)),
        ("two sum boundary negatives", -1, [0, 3, -3, 4, -1], (0, 4)),
        (
            "two sum sparse negatives and positives",
            -6,
            [-18, 12, 3, 0],
            (0, 1),
        ),
        ("two sum mixed order small positives", 6, [1, 3, 4, 2], (2, 3)),
    ),
)
def test_two_sum(criteria, target, nums, output):
    print(f"running {criteria}")
    assert two_sum(nums, target) == output
