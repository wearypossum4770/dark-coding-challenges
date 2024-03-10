import pytest
from easy.hello_love import hello_love


@pytest.mark.parametrize("name,expected", [
("Matt", "Hello, Matt!"),
("Helen", "Hello, Helen!"),
("Mubashir", "Hello, my Love!"),
])
def test_hello_love(name, expected):
    assert hello_love(name) == expected
