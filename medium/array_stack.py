def array_stack(target: list[int], n: int) -> list[str]:
    """
    :type target: List[int]
    :type n: int
    :rtype: List[str]
    """
    result = []
    index = 0
    counter = 1
    while index < len(target):
        result.append("Push")
        if target[index] == counter:
            index += 1
        else:
            result.append("Pop")
        counter += 1
    return result
