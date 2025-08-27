vowels = "aeiouAEIOU"


def to_goat_latin(sentence: str) -> str:
    words = []
    for i, word in enumerate(sentence.split(" ")):
        suffix = "a" * (i + 1)
        if word[0] in vowels:
            words.append(f"{word}ma{suffix}")
        elif word[0] not in vowels:
            words.append(f"{word[1::]}{word[0]}ma{suffix}")
    return " ".join(words)
