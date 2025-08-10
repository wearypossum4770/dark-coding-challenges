import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/merge_sorted_array.dart';

class MergeSortedArrayTestCases {
  List<int> first;
  int firstSize;
  List<int> second;
  int secondSize;
  List<int> expected;
  MergeSortedArrayTestCases(this.first, this.firstSize, this.second, this.secondSize, this.expected);
}

void main() {
  group("Feature: Merge Sorted Arrays", () {
    final testCases = [
      MergeSortedArrayTestCases([1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3, [1, 2, 2, 3, 5, 6]),
      MergeSortedArrayTestCases([1], 1, [], 0, [1]),
      MergeSortedArrayTestCases([0], 0, [1], 1, [1]),
    ];

    for (final step in testCases) {
      final first = step.first;
      final firstSize = step.firstSize;
      final second = step.second;
      final secondSize = step.secondSize;
      final expected = step.expected;
      test("\n\tGiven: two arrays $first with size $firstSize\n\t\t\tAnd: $second with size $secondSize.\n\tWhen: merged mergeSortedArray\n\tThen: the result is $expected", () {
        List<int> result = mergeSortedArray(first, firstSize, second, secondSize);
        expect(result, equals(expected));
      });
      test(
        "\n\tGiven: two arrays $first with size $firstSize\n\t\t\tAnd: $second with size $secondSize.\n\tWhen: merged mergeSortedArrayInPlace\n\tThen: the result is $expected",
        () {
          mergeSortedArrayInPlace(first, firstSize, second, secondSize);
					print("first: $first, expected: $expected, the results\n\n\n\n\n");
          expect(first, equals(expected));
        },
      );
    }
  });
}
