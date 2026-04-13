package easy

func MaxStockProfit(prices []int) int {
	mn := prices[0]
	mx := mn - 0 - mn
	for _, price := range prices {
		mn = min(mn, price)
		mx = max(mx, price-mn)
	}
	return mx
}
