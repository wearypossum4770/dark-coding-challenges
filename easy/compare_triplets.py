def compare_triplets(a, b):
    score = [0, 0]
    for index, _ in enumerate(a):
        if a[index] > b[index]:
            score[0] += 1
        if a[index] < b[index]:
            score[1] += 1
    return score
