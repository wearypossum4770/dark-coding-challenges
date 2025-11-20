import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/array_stack.dart';

class ArrayStackTestCases {
  List<int> target;
  int n;
  List<String> expected;
  ArrayStackTestCases(this.target, this.n, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      ArrayStackTestCases([1, 3], 3, ["Push", "Push", "Pop", "Push"]),
      ArrayStackTestCases([1, 2, 3], 3, ["Push", "Push", "Push"]),
      ArrayStackTestCases([1, 2], 4, ["Push", "Push"]),
      ArrayStackTestCases([1], 1, ["Push"]),
      ArrayStackTestCases([1], 100, ["Push"]),
      ArrayStackTestCases([2], 2, ["Push", "Pop", "Push"]),
      ArrayStackTestCases([3], 3, ["Push", "Pop", "Push", "Pop", "Push"]),
      ArrayStackTestCases([2, 3, 4], 4, ["Push", "Pop", "Push", "Push", "Push"]),
      ArrayStackTestCases([1, 3, 5, 7], 7, ["Push", "Push", "Pop", "Push", "Push", "Pop", "Push", "Push", "Pop", "Push"]),
      ArrayStackTestCases([5], 5, ["Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Pop", "Push"]),
      ArrayStackTestCases([4, 5], 5, ["Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Push"]),
      ArrayStackTestCases([1, 2, 4], 4, ["Push", "Push", "Push", "Pop", "Push"]),
    ];

    for (final step in testCases) {
      final target = step.target;
      final n = step.n;
      final expected = step.expected;
      test("\n\tGiven: the target value $target.\n\tWhen: operations on integer stream from 1 to $n.\n\tThen: the operations will be $expected.", () {
        List<String> actual = arrayStack(target, n);
        expect(actual, equals(expected));
      });
    }
  });
}
