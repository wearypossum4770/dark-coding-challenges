import re


def most_common_safe_word(paragraph: str, banned: list[str]) -> str:
    freq = {}
    words = re.split(r"[!?'.,;\s]+", paragraph.lower())
    for word in words:
        if word not in banned and len(word) > 0:
            freq[word] = freq.get(word, 0) + 1
    return sorted(freq.items(), reverse=True, key=lambda item: item[1])[0][0]
