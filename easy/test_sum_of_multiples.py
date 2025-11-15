import pytest
from easy.sum_of_multiples import array_of_multiples, sum_of_multiples


@pytest.mark.parametrize(
    "num, expected",
    (
        (7, 21),
        (10, 40),
        (9, 30),
    ),
)
def test_sum_of_multiples(num, expected):
    assert sum_of_multiples(num) == expected


@pytest.mark.parametrize(
    "num, size, expected",
    (
        (7, 5, [7, 14, 21, 28, 35]),
        (12, 10, [12, 24, 36, 48, 60, 72, 84, 96, 108, 120]),
        (17, 7, [17, 34, 51, 68, 85, 102, 119]),
        (
            630,
            14,
            [
                630,
                1260,
                1890,
                2520,
                3150,
                3780,
                4410,
                5040,
                5670,
                6300,
                6930,
                7560,
                8190,
                8820,
            ],
        ),
        (140, 3, [140, 280, 420]),
        (7, 8, [7, 14, 21, 28, 35, 42, 49, 56]),
        (
            11,
            21,
            [
                11,
                22,
                33,
                44,
                55,
                66,
                77,
                88,
                99,
                110,
                121,
                132,
                143,
                154,
                165,
                176,
                187,
                198,
                209,
                220,
                231,
            ],
        ),
    ),
)
def test_array_of_multiples(num, size, expected):
    assert array_of_multiples(num, size) == expected
