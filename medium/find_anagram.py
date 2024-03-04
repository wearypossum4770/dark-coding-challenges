def prepare_word(word):
    return "".join(sorted(word))


def find_anagram(word, candidates):
    """
    DOCUMENTATION
    """
    lower = word.lower()
    target = []
    for candidate in candidates:
        temp = candidate.lower()
        if lower == temp:
            continue
        if prepare_word(lower) == prepare_word(temp):
            target.append(candidate)
    return target


print(find_anagram("LISTEN", ["LISTEN", "Silent"]))
