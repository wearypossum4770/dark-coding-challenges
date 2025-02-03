import pytest
from easy.roman_to_int import roman_to_int


@pytest.mark.parametrize(
    "roman, arabic",
    (
        ("IV", 4),
        ("XC", 90),
        ("CM", 900),
        ("MMM", 3_000),
        ("III", 3),
        ("XXVII", 27),
        ("LVIII", 58),
        ("MCMXCIV", 1_994),
        ("MMMCMXCIV", 3_994),
        ("I", 1),
        ("VIII", 8),
        ("XXIX", 29),
        ("LIV", 54),
        ("CCV", 205),
        ("CDXLIV", 444),
        ("CMXCIX", 999),
        ("M", 1_000),
        ("MMMDCCCLXXXVIII", 3_888),
        ("MMMCMX", 3_910),
    ),
)
def test_roman_to_int(roman, arabic):
    assert roman_to_int(roman) == arabic
