def plus_minus(sample):
    length = len(sample)
    score = [0, 0]
    for num in sample:
        if num > 0:
            score[0] += 1
        if num < 0:
            score[1] += 1
    left = score[0] / length
    middle = score[1] / length
    right = 1 - (left + middle)
    return [left, middle, right]
