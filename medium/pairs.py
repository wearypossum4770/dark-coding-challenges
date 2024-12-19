def pairs(k: int, arr: list[int]) -> int:
    """
    copyright [Hacker Rank](https://www.hackerrank.com/challenges/pairs/problem)
    """
    previous = set()
    count = 0
    for num in arr:
        if num - k in previous:
            count += 1
        if num + k in previous:
            count += 1
        previous.add(num)
    return count
