def final_prices_with_discount(prices: list[int]) -> list[int]:
    for i in range(len(prices)):
        for j in range(i, len(prices)):
            if prices[j] < prices[i]:
                prices[i] -= prices[j]
                break
    return prices
