import 'dart:math';

int maxStockProfit(List<int> prices) {
  int mn = prices[0];
  int mx = mn - mn;
  for (int price in prices) {
    mn = min(mn, price);
    mx = max(mx, price - mn);
  }
  return mx;
}
