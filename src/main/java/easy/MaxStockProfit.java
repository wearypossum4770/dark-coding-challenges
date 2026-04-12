package easy;
public class MaxStockProfit {
public int solve(int[] prices) {
	int min = prices[0];
	int max = 0;
	for(int price: prices) {
		min = Math.min(min, price);
		max = Math.max(max, price - min);
	}
return max;
}}