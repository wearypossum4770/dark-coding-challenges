import pytest
from easy.future_people import future_people


@pytest.mark.parametrize(
    "poopulation, births,expected",
    [
        (256, 2, 976),
        (3248, 6, 5408),
        (5240, 3, 6320),
    ],
)
def test_future_people(poopulation, births, expected):
    assert future_people(poopulation, births) == expected
