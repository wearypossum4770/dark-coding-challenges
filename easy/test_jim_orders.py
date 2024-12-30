import pytest
from easy.jim_orders import jim_orders


@pytest.mark.parametrize(
    "orders, result",
    [
        # Basic test case
        ([[1, 1], [2, 2], [3, 3]], [1, 2, 3]),
        # Test with tied completion times (same delivery time)
        ([[1, 2], [2, 1], [1, 2]], [1, 2, 3]),  # Sorted by original indices
        # Test with the minimum input values (edge case)
        ([[0, 0], [0, 0], [0, 0]], [1, 2, 3]),
        # Test with maximum input values (to handle large numbers)
        ([[1_000_000, 1_000_000], [1_000_000, 0], [0, 1_000_000]], [2, 3, 1]),
        # Test with a single order (edge case)
        ([[1, 1]], [1]),
        # Test with identical times but different indices (ensuring sorting by index)
        ([[1, 2], [1, 2], [1, 2]], [1, 2, 3]),
        # Test where orders have varying times and random indices given [4, 2, 3, 1] should be [2, 3, 1, 4]
        ([[4, 2], [2, 1], [3, 2], [1, 5]], [2, 3, 1, 4]),
    ],
)
def test_jim_orders(orders, result):
    assert jim_orders(orders) == result
