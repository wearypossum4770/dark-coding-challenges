from collections import Counter


def is_anagram(s: str, t: str) -> bool:
    """
    [LeetCode](https://leetcode.com/problems/valid-anagram/description/)
    """
    freq = Counter(c for c in s.lower() if c.isalpha())
    for char in t.lower():
        value = freq.get(char)
        if char.isalpha():
            freq[char] -= 1
            if value is None or value <= 0:
                return False
    return len(tuple(freq.elements())) == 0
