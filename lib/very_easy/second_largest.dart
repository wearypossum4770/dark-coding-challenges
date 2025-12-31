import 'package:dark_coding_challenges/dark_coding_challenges.dart';

int secondLargest(List<int> nums) {
  int first = minSafeInteger();
  int second = minSafeInteger();
  for (int n in nums.toSet()) {
    if (first < n) {
      second = first;
      first = n;
    } else if (second < n && first > second) {
      second = n;
    }
  }
  return second;
}
