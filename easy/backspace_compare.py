def process_backspace_compare(text: str) -> str:
    result = []
    for c in text:
        if c == "#":
            if len(result) != 0:
                result.pop(-1)
        else:
            result.append(c)
    return "".join(result)


def backspace_compare(s: str, t: str) -> str:
    return process_backspace_compare(s) == process_backspace_compare(t)
