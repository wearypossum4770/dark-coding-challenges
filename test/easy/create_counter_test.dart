import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/create_counter.dart';

class CreateCounterTestCases {
  int n;
  List<String> operations;
  List<int> expected;
  CreateCounterTestCases(this.n, this.operations, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      CreateCounterTestCases(10, ['c', 'c', 'c'], [10, 11, 12]),
      CreateCounterTestCases(-2, ['c', 'c', 'c', 'c', 'c'], [-2, -1, 0, 1, 2]),
      CreateCounterTestCases(0, [], []),
      CreateCounterTestCases(1000, ['c'], [1000]),
      CreateCounterTestCases(0, ['c'], [0]),
      CreateCounterTestCases(0, [], []),
      CreateCounterTestCases(999, ['c', 'c', 'c'], [999, 1000, 1001]),
      CreateCounterTestCases(-1_000, ['c', 'c'], [-1000, -999]),
      CreateCounterTestCases(3, ['c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'], [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]),
      CreateCounterTestCases(
        42,
        ['c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'],
        [42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61],
      ),
      CreateCounterTestCases(7, ['c'], [7]),
      CreateCounterTestCases(100, ['c', 'c', 'c', 'c', 'c'], [100, 101, 102, 103, 104]),
      CreateCounterTestCases(-1000, ['c', 'c', 'c'], [-1000, -999, -998]),
    ];

    for (final step in testCases) {
      final n = step.n;
      final operations = step.operations;
      final expected = step.expected;
      test("\n\tGiven: a closure.\n\tWith: an initial values of $n.\n\tAnd: call stack of $operations.\n\tThen: the output will be $expected.", () {
        int Function() counter = createCounter(n);
        List<int> actual = List.filled(operations.length, 0);
        for (int i = 0; i < operations.length; i++) {
          counterCapture(actual, i, counter);
        }
        expect(actual, equals(expected));
      });
    }
  });
}
