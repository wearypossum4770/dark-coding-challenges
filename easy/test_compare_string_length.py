import pytest
from easy.compare_string_length import compare_string_length


@pytest.mark.parametrize(
    "a, b,expected",
    [
        ("AB", "CD", True),
        ("ABC", "DE", False),
        ("hello", "edabit", False),
        ("meow", "woof", True),
        ("jrnvjrnnt", "cvjknfjvmfvnfjn", False),
        ("jkvnjrt", "krnf", False),
        ("Facebook", "Snapchat", True),
    ],
)
def test_compare_string_length(a, b, expected):
    assert compare_string_length(a, b) == expected
