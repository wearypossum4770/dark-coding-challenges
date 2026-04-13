export const maxStockProfit = (prices: number[]): number => {
  let minPrice = prices[0];
    let max = 0;

    for (let i = 1; i < prices.length; i++) {
        minPrice = Math.min(minPrice, prices[i]);
        max = Math.max(max, prices[i] - minPrice);
    }		return max;
};
