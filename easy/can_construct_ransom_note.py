from collections import Counter


def can_construct_ransom_note(ransom_note: str, magazine: str) -> bool:
    freq = Counter(magazine.lower())
    for char in ransom_note:
        ch = char.lower()
        if ch not in freq:
            return False
        count = freq.get(ch, 0)
        if count < 1:
            return False
        freq[ch] = count - 1
    return True
