from re import IGNORECASE, sub


def is_palindrome(candidate: str) -> bool:
    cleaned = sub(r"[^a-zA-Z0-9]", "", candidate, flags=IGNORECASE).lower()
    if len(cleaned) < 2:
        return True
    return cleaned == cleaned[::-1]
