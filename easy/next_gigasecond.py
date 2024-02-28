from datetime import timedelta, datetime
gigasecond = 1_000_000_000
def next_gigasecond(moment):
    """
    Exercism: https://exercism.org/tracks/python/exercises/gigasecond/edit
    """
    delta = timedelta(seconds=gigasecond)
    return moment + delta
