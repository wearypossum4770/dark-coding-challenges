import pytest
from easy.accept_into_movie import accept_into_movie


@pytest.mark.parametrize(
    "age, supervised,expected",
    [
        (14, True, True),
        (15, True, True),
        (16, True, True),
        (14, False, False),
        (15, False, True),
        (16, False, True),
        (14.99999, True, True),
        (14.99999, False, False),
    ],
)
def test_accept_into_movie(age, supervised, expected):
    assert accept_into_movie(age, supervised) == expected
