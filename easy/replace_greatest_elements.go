package easy

func ReplaceGreatestElements(arr []int) []int {
	max := -1
	if len(arr) == 0 {
		return arr
	}
	right := len(arr)
	for right > 0 {
		right -= 1
		temp := arr[right]
		arr[right] = max
		if temp > max {
			max = temp
		}
	}
	return arr
}
