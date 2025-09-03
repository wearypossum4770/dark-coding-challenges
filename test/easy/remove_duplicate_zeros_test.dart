import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/remove_duplicate_zeros.dart';

class RemoveDuplicateZerosTestCases {
  List<int> nums;
  List<int> expected;
  RemoveDuplicateZerosTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      RemoveDuplicateZerosTestCases([1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]),
      RemoveDuplicateZerosTestCases([1, 2, 3], [1, 2, 3]),
      RemoveDuplicateZerosTestCases([0, 0, 0], [0, 0, 0]),
      RemoveDuplicateZerosTestCases([0], [0]),
      RemoveDuplicateZerosTestCases([7], [7]),
      RemoveDuplicateZerosTestCases([1, 2, 0], [1, 2, 0]),
      RemoveDuplicateZerosTestCases([0, 1, 0, 2, 0, 3], [0, 0, 1, 0, 0, 2]),
    ];

    for (final step in testCases) {
      var nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the array $nums.\n\tWhen: zeros are duplicated in-place, and last element is dropped.\n\tThen: it will be $expected", () {
        removeDuplicateZeros(nums);
        expect(nums, equals(expected));
      });
    }
  });
}
