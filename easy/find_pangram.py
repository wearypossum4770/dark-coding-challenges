alphabet = lambda: list("abcdefghijklmnopqrstuvwxyz")


def find_pangram(sentence):
    """
    DOCUMENTATION
    """
    result = [char in sentence.lower() for char in alphabet()]
    return all(result) if len(result) > 0 else false


def hacker_rank_pangram(sentence):
    return "pangram" if find_pangram(sentence) else "not pangram"
