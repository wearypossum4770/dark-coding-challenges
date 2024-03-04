from array import array


def counting_valleys(steps, path):
    """
    Hacker Rank https://www.hackerrank.com/challenges/counting-valleys/problem?isFullScreen=true
    """
    valley, count = 0, 0
    for segment in path:
        if segment == "U":
            count += 1
        else:
            count -= 1
        if segment == "U" and count == 0:
            valley += 1
    return valley
