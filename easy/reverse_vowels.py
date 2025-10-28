def is_vowel(s: str) -> bool:
    return s.lower() in ("a", "e", "i", "o", "u")


def reverse_vowels(s: str) -> str:
    left, right, result = 0, len(s) - 1, [""] * len(s)
    while left <= right:
        if not is_vowel(s[left]):
            result[left] = s[left]
            left += 1
        elif not is_vowel(s[right]):
            result[right] = s[right]
            right -= 1
        else:
            result[right] = s[left]
            result[left] = s[right]
            right -= 1
            left += 1

    return "".join(result)
