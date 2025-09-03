package easy

func RemoveDuplicateZeros(arr []int) {
	left := 0
	right := len(arr) - 1
	for left <= right {
		r := right
		if arr[left] == 0 {
			for r > left {
				arr[r] = arr[r-1]
				r -= 1
			}
			left += 1
		}
		left += 1
	}

}
