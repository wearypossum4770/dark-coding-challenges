def repeated_substring_pattern(s: str) -> bool:
    return s in (s * 2)[1:-1]
