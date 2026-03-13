def find_largest_altitude(gain: list[int]) -> int:
    result = [0] * (len(gain) + 1)
    altitude = 0
    for i in range(len(gain)):
        result[i] = gain[i] + altitude
        altitude += gain[i]
    return max(*result)
