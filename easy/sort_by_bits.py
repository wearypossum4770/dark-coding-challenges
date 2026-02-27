def sort_by_bits(arr: list[int]) -> list[int]:
    return sorted(arr, key=lambda x: (x.bit_count(), x))
