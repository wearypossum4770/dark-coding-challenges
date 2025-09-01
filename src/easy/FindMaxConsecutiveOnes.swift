func findMaxConsecutiveOnes(_ nums: [Int])-> Int {
	var count = 0
	var m: Int = 0
	for num in nums {
		if m < count {
			m = count
		}
		if num == 1 {
			count += 1
		}else {
			count = 0
		}
	}

	return max(m, count)
}