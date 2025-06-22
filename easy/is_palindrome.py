from re import IGNORECASE, sub


def is_palindrome(candidate: str) -> bool:
    cleaned = sub(r"[^a-zA-Z0-9]", "", candidate, flags=IGNORECASE).lower()
    if len(cleaned) < 2:
        return True
    return cleaned == cleaned[::-1]


def count_palindromes(text: str) -> int:
    total = 0
    for word in text.strip().split():
        if is_palindrome(word):
            total += 1
    return total
