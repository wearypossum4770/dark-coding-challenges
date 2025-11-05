import pytest
from easy.create_counter import capture, create_counter


@pytest.mark.parametrize(
    "desc, n, operations, expected",
    [
        (
            "Example 1: starting at 10 with 3 calls",
            10,
            ["call"] * 3,
            [10, 11, 12],
        ),
        (
            "Example 2: starting at -2 with 5 calls",
            -2,
            ["call"] * 5,
            [-2, -1, 0, 1, 2],
        ),
        # ("Edge Case 1: starting at 0 with no calls", 0, [], []),
        ("Edge Case 2: single call from 1_000", 1_000, ["call"], [1_000]),
        ("single call from zero", 0, ["call"], [0]),
        (
            "Edge Case 3: starting at -1_000 with 3 calls",
            -1_000,
            ["call", "call", "call"],
            [-1_000, -999, -998],
        ),
        ("lower bound near -1_000", -1_000, ["call"] * 2, [-1_000, -999]),
        ("upp bound near 1_000", 999, ["call"] * 3, [999, 1_000, 1_001]),
        (
            "Edge Case 4: 1_000 calls starting from 5",
            5,
            ["call"] * 1_000,
            [5 + i for i in range(1_000)],
        ),
        (
            "mutliple increments (10 calls)",
            3,
            ["call"] * 10,
            [3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        ),
        (
            "stress test (20 increments)",
            42,
            ["call"] * 20,
            [
                42,
                43,
                44,
                45,
                46,
                47,
                48,
                49,
                50,
                51,
                52,
                53,
                54,
                55,
                56,
                57,
                58,
                59,
                60,
                61,
            ],
        ),
        ("single call (simple check)", 7, ["call"], [7]),
        ("midrange five calls", 100, ["call"] * 5, [100, 101, 102, 103, 104]),
    ],
)
def test_create_counter(
    desc: str, n: int, operations: list[str], expected: list[int]
):
    counter = create_counter(n)
    actual = [0] * len(operations)
    for i in range(len(operations)):
        capture(actual, i, counter)
    assert actual == expected, f"Failed: {desc}"
