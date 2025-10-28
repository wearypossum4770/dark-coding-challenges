from easy.is_palindrome import is_palindrome


def find_first_palindrome(words: list[str]) -> str:
    for word in words:
        if is_palindrome(word):
            return word
    return ""
