def frequency_sort(s: str) -> str:
    freq = {}
    for char in s:
        freq[char] = freq.get(char, 0) + 1
    result = sorted(freq.items(), key=lambda item: item[1], reverse=True)
    return "".join([x * y for x, y in result])
