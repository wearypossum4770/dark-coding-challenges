def top_frequent_words(words: list[str], k: int) -> list[str]:
    freq = {}
    for word in words:
        freq[word] = freq.get(word, 0) + 1
    result = sorted(freq.items(), key=lambda x: (-x[1], x[0]))
    return list(map(lambda x: x[0], result))[0:k]
