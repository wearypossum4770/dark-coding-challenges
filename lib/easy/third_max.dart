
import 'package:dark_coding_challenges/dark_coding_challenges.dart';

int thirdMax(List<int> nums) {
  int maxInt = minSafeInteger();
  int first = maxInt;
  int second = first;
  int third = first;
  for (int n in nums) {
    if (first == n) continue;
    if (first < n) {
      third = second;
      second = first;
      first = n;
    } else if (second < n && first > n) {
      third = second;
      second = n;
    } else if (third < n && second > n) {
      third = n;
    }
  }
  return third == maxInt ? first : third;
}
