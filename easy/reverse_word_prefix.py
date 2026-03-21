def reverse_word_prefix(word: str, ch: str) -> str:
    if ch not in word:
        return word
    i = word.index(ch)
    return word[: i + 1][::-1] + word[i + 1 :]
