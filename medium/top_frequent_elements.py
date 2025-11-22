def top_frequent_elements(nums: list[int], k: int) -> list[int]:
    freq = {}
    for n in nums:
        freq[n] = freq.get(n, 0) + 1
    result = sorted(freq.items(), key=lambda item: item[1], reverse=True)
    return [x for x, _ in result][:k]
