import pytest
from easy.remove_array_duplicates import remove_array_duplicates


@pytest.mark.parametrize(
    "num, expected, mutated",
    (
        ([1, 1, 2], 2, [1, 2]),
        ([1, 2, 2, 3, 3], 3, [1, 2, 3]),
        ([1, 1, 2, 2, 3, 3, 4], 4, [1, 2, 3, 4]),
        ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4], 5, [0, 1, 2, 3, 4]),
        ([1], 1, [1]),
        ([0], 1, [0]),
    ),
)
@pytest.mark.skipif(True, reason="Not Implemented")
def test_remove_array_duplicates(
    num: list[int], expected: int, mutated: list[int]
):
    copy = num.copy()
    result = remove_array_duplicates(num)
    assert result == expected, f"Expected k={expected}, got {result}"
    assert (
        num[:result] == mutated
    ), f"Expected mutated array={mutated}, got {num[:result]}"
    if len(num) >= 2:
        assert (
            copy != num
        ), f"Expected array to be mutated, but {copy} == {num}"
