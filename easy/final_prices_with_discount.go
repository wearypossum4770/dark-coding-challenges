package easy

func FinalPricesWithDiscount(prices []int) []int {
	result := make([]int, len(prices))
	copy(result, prices)
	for i := 0; i < len(prices); i++ {
		for j := i + 1; j < len(prices); j++ {
			if prices[j] <= prices[i] {
				result[i] = prices[i] - prices[j]
				break
			}
		}

	}
	return result
}
