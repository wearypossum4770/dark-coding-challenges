import pytest
from easy.circuit_power import circuit_power


@pytest.mark.parametrize("voltage, current,expected", [
        (110, 3, 330),
        (230, 10, 2300),
        (480, 20, 9600),

])
def test_circuit_power(voltage, current, expected):
    assert circuit_power(voltage, current) == expected
