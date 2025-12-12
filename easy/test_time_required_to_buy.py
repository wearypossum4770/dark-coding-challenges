import pytest
from easy.time_required_to_buy import time_required_to_buy


@pytest.mark.parametrize(
    "tickets, k, expected",
    [
        [[2, 3, 2], 2, 6],
        [[5, 1, 1, 1], 0, 8],
        [[1], 0, 1],
        [[1, 1, 1, 1], 3, 4],
        [[3, 3, 3], 0, 7],
        [[3, 3, 3], 1, 8],
        [[3, 3, 3], 2, 9],
        [[1, 2, 3, 4], 3, 10],
        [[4, 3, 2, 1], 0, 10],
        [[4, 3, 2, 1], 1, 9],
        [[4, 3, 2, 1], 2, 7],
        [[4, 3, 2, 1], 3, 4],
        [[100, 100, 100], 1, 299],
        [[1, 100, 1], 1, 102],
        [[2, 1], 1, 2],
        [[2, 1], 0, 3],
        [[1, 2], 0, 1],
        [[1, 2], 1, 3],
    ],
)
def test_time_required_to_buy(tickets: list[int], k: int, expected: int):
    assert time_required_to_buy(tickets, k) == expected
