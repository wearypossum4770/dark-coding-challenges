from string import ascii_lowercase


def is_pangram(text: str) -> bool:
    return set(ascii_lowercase) <= set(text.lower())
