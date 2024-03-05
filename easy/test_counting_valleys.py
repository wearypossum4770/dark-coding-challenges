import pytest
from easy.counting_valleys import counting_valleys


@pytest.mark.parametrize(
    "steps, path, expected",
    [
        (8, "UDDDUDUU", 1),
        (12, "DDUUDDUDUUUD", 2),
    ],
)
def test_counting_valleys(steps, path, expected):
    assert counting_valleys(steps, path) == expected
