import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/remove_element.dart';

class RemoveElementTestCases {
  List<int> nums;
  int target;
  int expected;
  List<int> output;
  RemoveElementTestCases(this.nums, this.target, this.expected, this.output);
}

void main() {
  group("\n\tFeature: Remove Element", () {
    final testCases = [
      RemoveElementTestCases([3, 2, 2, 3], 3, 2, [2, 2]),
      RemoveElementTestCases([0, 1, 2, 2, 3, 0, 4, 2], 2, 5, [0, 1, 3, 0, 4]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final target = step.target;
      final expected = step.expected;
      final output = step.output;
      test(
        "\n\tGiven an array $nums not guranteed sorted.\n\tAnd: a target to remove $target.\n\tWhen: target is removed.\n\tThen: it should be $expected.\n\tAlso: the mutated array will be $output",
        () {
          int result = removeElement(nums, target);
          expect(nums.sublist(0, result), equals(output));
          expect(result, equals(expected));
        },
      );
    }
  });
}
