func findLucky(_ arr: [Int])-> Int {
	var nums = Array(repeating: 0, count: (arr.max() ?? 0) + 1)
	var index = nums.count - 1
	for num in arr {
		nums[num] += 1
	}
	while index > 0 {
		if nums[index] == index {
			return index
		}
		index -= 1
	}
	return -1
}