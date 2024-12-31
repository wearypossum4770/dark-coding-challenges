import pytest
from easy.balanced_sums import balanced_sums

size = 100_000


def test_single_element():
    assert balanced_sums([42]) == "YES"


def test_two_elements_unbalanced():
    assert balanced_sums([1, 2]) == "NO"


def test_large_unbalanced_array():
    # Create a large array that cannot be balanced
    large_arr = [1] * size
    large_arr[0] = size  # Make first element larger than sum of all others
    assert balanced_sums(large_arr) == "NO"


@pytest.mark.parametrize(
    "arr, expected",
    (
        # Basic test cases
        ([1, 2, 3], "NO"),
        ([1, 2, 3, 3], "YES"),
        ([1], "YES"),
        # Edge cases
        ([], "NO"),  # Empty array array can have 1 ≤ n ≤ 10⁵
        ([0], "YES"),  # Single zero
        ([1, 1, 1, 1, 1], "YES"),  # All same numbers
        ([5, 5, 5], "YES"),  # All elements same
        ([5, 5, 5, 5], "NO"),  # All elements same (even count)
        ([2, 0, 0, 0], "YES"),  # Leading number with zeros
        ([0, 0, 0, 2], "YES"),  # Trailing number with zeros
        ([1, 2, 3, 3], "YES"),  # Balance at the last element
        # Negative numbers
        ([-1, -2, -3, -4, -1], "NO"),
        ([-2, -3, 10, -3, -2], "YES"),
        ([1, -1, 0], "YES"),  # Includes zero
        ([-1, -1, 2], "NO"),  # Negative numbers
        # Large numbers
        ([1e6, 0, 1e6], "YES"),
        ([999999] * 4, "NO"),
        # Longer sequences
        ([5, 6, 8, 11], "YES"),
        ([1, 2, 3, 4, 6], "YES"),
        # Zero-sum cases
        ([0, 0, 0, 0], "YES"),
        ([0, 0, 1, 0], "YES"),
        # Complex cases
        ([2, 0, 0, 0, 2], "YES"),
        ([1, 1, 4, 1, 1], "YES"),
        ([20, 10, 30, 10, 20], "YES"),
        ([10, 10, 10, 30, 10, 10, 10], "YES"),  # Balance point with equal left and right sums
        ([0, 0, 0, 0], "YES"),  # All elements are zero
        ([10, 20, 30, 40], "NO"),  # No balance point
        ([1, 1, 1, 3, 1, 1, 1], "YES"),  # Multiple balancing points
        ([10, 0, 0], "YES"),  # One side only
    ),
)
def test_balanced_sums(arr, expected):
    assert balanced_sums(arr) == expected
