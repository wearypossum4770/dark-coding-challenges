def longest_common_prefix(strs):
    """
    DOCUMENTATION
    """
    if not strs or len(strs) == 0:
        return ""
    prefix = [""] * len(max(strs, key=len))
    for outdex, outer in enumerate(strs):
        for index, inner in enumerate(outer):
            if inner == strs[0][outdex]:
                prefix.insert(index, inner)
    return "".join(prefix)
