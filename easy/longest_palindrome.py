def longest_palindrome(s: str) -> int:
    freq = {}
    for c in s:
        freq[c] = freq.get(c, 0) + 1
    odds = len(list(filter(lambda x: x % 2 == 1, freq.values())))
    if odds > 1:
        return len(s) + 1 - odds
    return len(s)
