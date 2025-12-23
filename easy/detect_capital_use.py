def detect_capital_use(word: str) -> bool:
    if word == word.upper() or (
        word[1:] == word[1:].lower() and word[0].isupper()
    ):
        return True
    return word == word.lower()
