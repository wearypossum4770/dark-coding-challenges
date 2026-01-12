import 'package:collection/collection.dart';

List<int> relativeSortArray(List<int> arr1, List<int> arr2) {
  List<int> result = List.filled(arr1.length, 0);
  Map<int, int> freq = {};
  int index = 0;
  for (int n in arr1) {
    freq[n] = (freq[n] ?? 0) + 1;
  }
  for (int n in arr2) {
    int count = freq[n] ?? 0;
    while (count > 0) {
      count--;
      result[index++] = n;
    }
    if (count == 0) freq.removeWhere((key, _) => key == n);
  }
  for (int entry in freq.keys.toList().sorted((a, b) => a - b)) {
    int count = freq[entry] ?? 0;
    while (count > 0) {
      result[index++] = entry;
      count--;
    }
  }

  return result;
}
