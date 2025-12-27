def license_key_formatting(s: str, k: int) -> str:
    word = s.replace("-", "").upper()
    if len(word) < k:
        return word
    result = []
    left, right = 0, len(word) - 1
    while right >= 0:
        if left == k:
            result.insert(0, "-")
            left = 0
        result.insert(0, word[right])
        left += 1
        right -= 1
    return "".join(result)
