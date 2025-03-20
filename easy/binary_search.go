package easy

func BinarySearch(nums []int, target int) int {
	left := 0
	right := len(nums) - 1

	for left <= right {
		midpoint := (right + left) / 2
		if nums[midpoint] == target {
			return midpoint
		} else if nums[midpoint] < target {
			left = midpoint + 1
		} else {
			right = midpoint - 1
		}
	}
	return -1
}
