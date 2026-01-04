import 'dart:typed_data';
import 'dart:convert';

String truncateList<T>(List<T> list, {int maxItems = 5}) {
  final preview = list.take(maxItems);
  final suffix = list.length > maxItems ? ", ..." : "";
  return '[${preview.join(", ")}$suffix]';
}

int calculate() {
  return 6 * 7;
}

int minSafeInteger() => -(1 << 53) + 1;
int maxSafeInteger() => (1 << 53) - 1;
Map<int, int> characterFrequency(String text) {
  Map<int, int> freq = {};
  for (var char in Uint8List.fromList(utf8.encode(text))) {
    freq.update(char, (count) => count + 1, ifAbsent: () => 1);
  }
  return freq;
}

class Grocery {
  final String product;
  final int quantity;
  final double price;
  Grocery(this.product, this.quantity, this.price);
  double getTotal() {
    return price * quantity;
  }
}
