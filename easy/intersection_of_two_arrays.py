def intersection_of_two_arrays(nums1: list[int], nums2: list[int]) -> list[int]:
	freq = {}
	result = []
	for n in nums1:
		freq[n] = freq.get(n, 0) + 1
	for n in nums2:
		count = freq.get(n, 0)
		if count > 0:
			result.append(n)
		freq[n] = count - 1
	return result