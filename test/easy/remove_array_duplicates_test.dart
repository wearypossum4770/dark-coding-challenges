import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/remove_array_duplicates.dart';

class RemoveArrayDuplicatesTestCases {
  List<int> nums;
  int expected;
  RemoveArrayDuplicatesTestCases(this.nums, this.expected);
}

void main() {
  group("\n\tFeature: Remove Duplicates", () {
    final testCases = [
      RemoveArrayDuplicatesTestCases([1, 1, 2], 2),
      RemoveArrayDuplicatesTestCases([1, 2, 2, 3, 3], 3),
      RemoveArrayDuplicatesTestCases([1, 1, 2, 2, 3, 3, 4], 4),
    ];

    for (final step in testCases) {
      final expected = step.expected;
      final nums = step.nums;
      test("\n\tGiven: an array $nums.\n\tWhen: duplicates are removed.\n\tThen: is contains $expected elements", () {
        int result = removeArrayDuplicates(nums);
        expect(result, equals(expected));
      });
    }
  });
}
