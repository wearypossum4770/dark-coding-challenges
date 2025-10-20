import 'package:collection/collection.dart';

int findLucky(List<int> arr) {
  List<int> nums = List.filled(arr.max + 1, 0);
  for (final n in arr) {
    nums[n]++;
  }
  int index = nums.length - 1;
  while (index > 0) {
    if (nums[index] == index) return index;
    index--;
  }
  return -1;
}
