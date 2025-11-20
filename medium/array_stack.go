package medium

func ArrayStack(target []int, n int) []string {
	result := []string{}
	index := 0
	counter := 1
	for index < len(target) {
		result = append(result, "Push")
		if counter == target[index] {
			index++
		} else {
			result = append(result, "Pop")
		}
		counter++
	}
	return result
}
