def majority_frequency_group(s: str) -> str:
    entries, freq = {}, {}
    for char in s:
        if char in freq:
            freq[char] += 1
        else:
            freq[char] = 1
    for k, v in freq.items():
        if v in entries:
            entries[v] += k
        else:
            entries[v] = k

    groups = [
        (v, k)
        for k, v in sorted(entries.items(), key=lambda x: (-len(x[1]), -x[0]))
    ]
    return groups[0][0]
