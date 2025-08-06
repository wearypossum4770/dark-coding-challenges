from collections import Counter


def is_anagram(s: str, t: str) -> bool:
    """
    [LeetCode](https://leetcode.com/problems/valid-anagram/description/)
    """
    return Counter(c for c in s.lower() if c.isalpha()) == Counter(
        c for c in t.lower() if c.isalpha()
    )


def detect_anagrams(word: str, candidates: list[str]) -> list[str]:
    return [
        candidate
        for candidate in candidates
        if word.lower() != candidate.lower() and is_anagram(word, candidate)
    ]
