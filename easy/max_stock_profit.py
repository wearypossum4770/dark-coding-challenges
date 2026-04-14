def max_stock_profit(prices: list[int]) -> int:
    mn = prices[0]
    mx = mn - mn
    for price in prices:
        mn = min(mn, price)
        mx = max(mx, price - mn)
    return mx
