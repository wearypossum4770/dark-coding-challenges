def to_celsius(fahrenheit: float) -> float:
    return (fahrenheit - 32) * 5 / 9


def to_fahrenheit(celsius: float) -> float:
    return (celsius * 1.8) + 32


def to_kelvin(celsius: float) -> float:
    return celsius + 273.15


def convert_temperature(celsius: float) -> list[float]:
    return [to_kelvin(celsius), to_fahrenheit(celsius)]

