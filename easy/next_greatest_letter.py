def next_greatest_letter(letters: list[str], target: str) -> str:
    for char in letters:
        if target < char:
            return char
    return letters[0]
