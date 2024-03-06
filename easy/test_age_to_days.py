import pytest
from easy.age_to_days import age_to_days


@pytest.mark.parametrize(
    "age,expected",
    [
        (10, 3650),
        (0, 0),
        (73, 26645),
    ],
)
def test_age_to_days(age, expected):
    assert age_to_days(age) == expected
