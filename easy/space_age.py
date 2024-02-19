def orbital_periods(planet):
    return {
    "mercury":  0.2408467,
    "venus":  0.61519726,
    "mars":  1.8808158,
    "jupiter":  11.862615,
    "saturn":  29.447498,
    "uranus":  84.016846,
    "neptune":  164.79132,
    }.get(planet, 1)

def space_age(planet, seconds):
    """
    DOCUMENTATION
    """
    earth_years = 31_557_600
    periods = orbital_periods(planet=planet)
    return seconds / (earth_years * periods)

