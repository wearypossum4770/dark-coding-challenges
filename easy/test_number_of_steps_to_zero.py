import pytest
from easy.number_of_steps_to_zero import number_of_steps_to_zero


@pytest.mark.parametrize(
    "n, expected",
    [
        (2, 2),
        (0, 0),
        (1, 1),
        (8, 4),
        (14, 6),
        (123, 12),
        (1_000_000, 26),
        (-1, 0),
        (999_999, 31),
    ],
)
def test_number_of_steps_to_zero(n: int, expected: int):
    assert number_of_steps_to_zero(n) == expected
