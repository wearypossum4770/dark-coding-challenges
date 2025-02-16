import pytest
from easy.fizz_buzz import fizz_buzz


@pytest.mark.parametrize(
    "num, expected",
    (
        (
            5,
            # fmt: off
            ["1","2","fizz","4","buzz"]
            # fmt: on
        ),
        (
            3,
            # fmt: off
            ["1","2","fizz"]
            # fmt: on
        ),
        (
            16,
            # fmt: off
            ["1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz", "16",]
            # fmt: on
        ),
        (
            15,
            # fmt: off
            ["1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14","fizzbuzz"]
            # fmt: on
        ),
        (
            35,
            # fmt: off
            ["1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14","fizzbuzz","16","17","fizz","19","buzz","fizz","22","23","fizz","buzz","26","fizz","28","29","fizzbuzz","31","32","fizz","34","buzz"]
            # fmt: on
        ),
    ),
)
def test_fizz_buzz(num, expected):
    assert fizz_buzz(num) == expected
