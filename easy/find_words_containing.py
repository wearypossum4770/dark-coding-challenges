def find_words_containing(words: list[str], x: str) -> list[int]:
    return [index for index, word in enumerate(words) if x in word]
