import pytest
from easy.subtraction import subtraction


@pytest.mark.parametrize("minuend, subtrahend,difference", [
    (945, 422, 523)
])
def test_subtraction(minuend, subtrahend, difference):
    assert subtraction(minuend, subtrahend) == difference
