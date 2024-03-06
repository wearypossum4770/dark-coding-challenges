import pytest
from easy.circuit_power import circuit_power


@pytest.mark.parametrize("num,expected", [])
def test_circuit_power(num, expected):
    assert circuit_power(num) == expected
