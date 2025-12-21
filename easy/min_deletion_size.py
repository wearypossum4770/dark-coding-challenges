def min_deletion_size(strs: list[str]) -> int:
    count = 0
    for column in zip(*strs):
        for i, char in enumerate(column[1:]):
            if column[i] > char:
                count += 1
                break

    return count
