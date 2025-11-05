package easy

func CreateCounter(n int) func() int {
	count := n
	increment := func() int {
		current := count
		count += 1
		return current
	}
	return increment
}

func CounterCapture(nums []int, index int, counter func() int) {
	nums[index] = counter()
}
