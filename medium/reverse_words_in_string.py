def reverse_words_in_string(s: str) -> str:
    return " ".join(
        [x for x in s.strip().split(" ") if x not in [" ", ""]][::-1]
    )


print(reverse_words_in_string("  1  2  3  "))
