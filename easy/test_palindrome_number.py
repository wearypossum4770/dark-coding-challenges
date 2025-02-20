import pytest
from easy.palindrome_number import palindrome_number


@pytest.mark.parametrize(
    "candidate, expected",
    (
        (1000021, False),
        (1611881161, True),
        (-121, False),
        (121, True),
        (10, False),
        (-101, False),
        (-10, False),
        (-1, False),
        (0, True),
        (3, True),
        (8, True),
        (9, True),
        (11, True),
        (100, False),
        (-101, False),
        (1, True),
        (123, False),
        (313, True),
        (1000030001, False),
        (838, True),
        (77, True),
        (95159, True),
        (839, False),
        (4234, False),
        (13, False),
    ),
)
def test_palindrome_number(candidate, expected):
    assert palindrome_number(candidate) == expected
