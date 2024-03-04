def prepare_word(word):
    return list(word)
def find_anagram(word, candidates):
    """
    DOCUMENTATION
    """
    for candidate in candidates:
        if word.lower() == candidate.lower():
            continue

    return None

print(find_anagram("LISTEN", ["LISTEN", "Silent"]))