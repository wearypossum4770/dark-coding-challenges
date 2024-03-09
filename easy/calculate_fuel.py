def calculate_fuel(distance):
    """
    DOCUMENTATION
    """
    tank = distance * 10
    return tank if tank > 100 else 100
