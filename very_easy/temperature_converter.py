def to_celsius(fahrenheit: float) -> float:
    return (fahrenheit - 32) * 5 / 9


def to_fahrenheit(celsius: float) -> float:
    return (celsius * 1.8) + 32


def to_kelvin(celsius: float) -> float:
    return celsius + 273.15


def convert_temperature(celsius: float) -> list[float]:
    return [to_kelvin(celsius), to_fahrenheit(celsius)]


def temperature_converter(deg: str) -> str:
    temp = int(
        "".join([x for x in deg if x.isnumeric() or x == "." or x == "-"])
    )
    if deg.endswith("°F"):
        return f"{round(to_celsius(temp))}°C"
    elif deg.endswith("°C"):
        return f"{round(to_fahrenheit(temp))}°F"
    else:
        return "Error"
