import pytest
from easy.is_pangram import is_pangram


@pytest.mark.parametrize(
    "criteria, expected, text",
    (
        ("empty sentence", False, ""),
        ("perfect lower case", True, "abcdefghijklmnopqrstuvwxyz"),
        (
            "only lower case",
            True,
            "the quick brown fox jumps over the lazy dog",
        ),
        (
            "missing the letter 'x'",
            False,
            "a quick movement of the enemy will jeopardize five gunboats",
        ),
        (
            "missing the letter 'h'",
            False,
            "five boxing wizards jump quickly at it",
        ),
        (
            "with underscores",
            True,
            "the_quick_brown_fox_jumps_over_the_lazy_dog",
        ),
        (
            "with numbers",
            True,
            "the 1 quick brown fox jumps over the 2 lazy dogs",
        ),
        (
            "missing letters replaced by numbers",
            False,
            "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog",
        ),
        (
            "mixed case and punctuation",
            True,
            '"Five quacking Zephyrs jolt my wax bed."',
        ),
        (
            "a-m and A-M are 26 different characters but not a pangram",
            False,
            "abcdefghijklm ABCDEFGHIJKLM",
        ),
        (
            "non-alphanumeric printable ASCII",
            False,
            " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~",
        ),
        ("special characters only", False, "@#$%^&*()"),
        (
            "false spanish alphabet contains non-english letters.",
            False,
            "El veloz murciélago hindú comía feliz cardillo y kiwi",
        ),
        # (
        #     "true spanish case contains non-english letters",
        #     False,
        #     "Benjamín pidió una bebida de kiwi y fresa. Noé, sin vergüenza, la más exquisita champaña del menú",
        # ),
        ("A welsh sentence", True, "Cwm fjord-bank glyphs vext quiz"),
        # Graphemes and emojis (valid for custom alphabet including emojis)
        ("emoji_in_alphabet", False, "🍎🍌🍍 🍉🍇 🍓🍑🍒🍋🥭"),
    ),
)
def test_is_pangram(criteria, expected, text):
    print(f"Given: {criteria} expect: {text} to be a pangram? {expected}")
    assert (
        is_pangram(text) == expected
    ), f"Failed for criteria: {criteria}. Text: '{text}'"
