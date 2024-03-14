import pytest
from easy.should_serve_drinks import should_serve_drinks


@pytest.mark.parametrize(
    "age, on_break,expected",
    [
        (17, True, False),
        (30, True, False),
        (24, False, True),
        (18, False, True),
        (3, False, False),
    ],
)
def test_should_serve_drinks(age, on_break, expected):
    assert should_serve_drinks(age, on_break) == expected
