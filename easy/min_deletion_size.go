package easy

func MinDeletionSize(strs []string) int {
	count := 0
	rows := len(strs)
	cols := len(strs[0])
	for col := 0; col < cols; col++ {
		for row := 1; row < rows; row++ {
			if strs[row-1][col] > strs[row][col] {
				count++
				break
			}
		}
	}
	return count
}
