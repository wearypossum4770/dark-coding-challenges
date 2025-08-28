package easy

func RemoveArrayDuplicates(nums *[]int) int {
	count := 0
	if len(*nums) <= 1 {
		return 1
	}
	for i := 0; i < len(*nums); i++ {
		if (*nums)[count] != (*nums)[i] {
			count += 1
			(*nums)[count] = (*nums)[i]

		}
	}
	return count + 1
}
