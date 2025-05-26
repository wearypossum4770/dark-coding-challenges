import pytest
from very_easy.array_sum import array_sum


@pytest.mark.parametrize("num, expected", [])
def test_array_sum(num, expected):
    assert array_sum(num) == expected
