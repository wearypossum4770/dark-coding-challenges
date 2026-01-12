from collections import Counter


def relative_sort_array(arr1: list[int], arr2: list[int]) -> list[int]:
    result = [0] * len(arr1)
    index = 0
    freq = Counter(arr1)
    for num in arr2:
        while freq[num]:
            result[index] = num
            freq[num] -= 1
            index += 1
        del freq[num]
    remainder = sorted(freq.items(), key=lambda x: x[0])
    for num, total in remainder:
        while total > 0:
            result[index] = num
            total -= 1
            index += 1
    return result
