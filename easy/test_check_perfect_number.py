import pytest
from easy.check_perfect_number import (
    calculate_perfect_number,
    is_perfect_number,
    classify_perfect_number,
)


@pytest.mark.parametrize(
    "n, expected",
    [
        pytest.param(496, True, id="Perfect number 496", ),
        pytest.param(8128, True, id="Perfect number 8_128", ),
        pytest.param(8589869056, True, id="Perfect number 8_589_869_056", ),
        pytest.param(137438691328, True, id="Perfect number 137_438_691_328", ),
        pytest.param(6, True, id="Smallest perfect number", ),
        pytest.param(28, True, id="Medium perfect number", ),
        pytest.param(33550336, True, id="Large perfect number", ),
        pytest.param(12, False, id="Smallest abundant number", ),
        pytest.param(30, False, id="Medium abundant number", ),
        pytest.param(33550335, False, id="Large abundant number", ),
        pytest.param(2, False, id="Smallest prime deficient number", ),
        pytest.param(4, False, id="Smallest non-prime deficient number", ),
        pytest.param(32, False, id="Medium deficient number", ),
        pytest.param(33550337, False, id="Large deficient number", ),
    ],
)
def test_is_perfect_number(n: int, expected: bool):
    assert is_perfect_number(n) == expected


@pytest.mark.parametrize(
    "n, expected",
    [
        (496, 496),
        (8128, 8128),
        (8589869056, 8589869056),
        (137438691328, 137438691328),
        (6, 6),
        (28, 28),
        (33550336, 33550336),
        (12, 16),
        (30, 42),
        (33550335, 39885825),
        (2, 1),
        (4, 3),
        (32, 31),
        (33550337, 1),
    ],
)
def test_calculate_perfect_number(n: int, expected: int):
    assert calculate_perfect_number(n) == expected


@pytest.mark.parametrize(
    "expected, n",
    [
        ("perfect", 496),
        ("perfect", 8128),
        ("perfect", 8589869056),
        ("perfect", 137438691328),
        ("perfect", 6),
        ("perfect", 28),
        ("perfect", 33550336),
        ("abundant", 12),
        ("abundant", 30),
        ("abundant", 33550335),
        ("deficient", 2),
        ("deficient", 4),
        ("deficient", 32),
        ("deficient", 33550337),
        ("deficient", 0, ),
        ("deficient", 1, ),
    ],
)
def test_classify_perfect_number(expected: str, n: int):
    assert classify_perfect_number(n) == expected
