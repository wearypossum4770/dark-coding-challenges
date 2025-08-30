import pytest
from easy.add_binary import add_binary


@pytest.mark.parametrize(
    "a, b, expected",
    [
        ("11", "1", "100"),
        ("1010", "1011", "10101"),
        ("0", "0", "0"),
    ],
)
def test_add_binary(a: str, b: str, expected: str):
    assert add_binary(a, b) == expected
