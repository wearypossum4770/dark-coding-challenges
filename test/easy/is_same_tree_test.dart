import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/is_same_tree.dart';
import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

class IsSameTreeTestCases {
  String a;
  String b;
  bool expected;
  IsSameTreeTestCases(this.a, this.b, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      IsSameTreeTestCases("1 2 x x 3 x x", "1 2 x x 3 x x", true),
      IsSameTreeTestCases("1 2 x x 3 x x", "1 2 x x x", false),
      IsSameTreeTestCases("1 2 x x 3 x x", "1 x 2 x x", false),
      IsSameTreeTestCases("1 2 3 x x x x", "1 x 2 x 3 x x", false),
      IsSameTreeTestCases("x", "x", true),
      IsSameTreeTestCases("1 x x", "x", false),
      IsSameTreeTestCases("1 x x", "1 x x", true),
      IsSameTreeTestCases("1 x x", "2 x x", false),
      IsSameTreeTestCases("1 2 x x x", "1 x 2 x x", false),
      IsSameTreeTestCases("1 2 3 x x x x", "1 2 3 x x x x", true),
      IsSameTreeTestCases("1 2 3 x x x x", "1 2 4 x x x x", false),
      IsSameTreeTestCases("5 3 1 x x 4 x x 7 6 x x 9 x x", "5 3 1 x x 4 x x 7 6 x x 9 x x", true),
      IsSameTreeTestCases("1 2 4 x x 5 x x 3 6 x x 7 x x", "1 2 4 x x 5 x x 3 6 x x 8 x x", false),
      IsSameTreeTestCases("1 2 x x 3 x x", "1 x 2 x 3 x x", false),
      IsSameTreeTestCases("10 5 2 x x 7 x x 15 12 x x 20 x x", "10 5 2 x x 7 x x 15 12 x x 20 x x", true),
      IsSameTreeTestCases("1 x 2 x 3 x 4 x x", "1 x 2 x 3 x 4 x x", true),
      IsSameTreeTestCases("4 3 2 1 x x x x x", "4 3 2 1 x x x x x", true),
      IsSameTreeTestCases("8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x", "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x", true),
      IsSameTreeTestCases("3 x 4 x 5 x 6 x x", "3 x 4 x 5 x 7 x x", false),
      IsSameTreeTestCases("100 50 25 x x 75 x x 150 125 x x 175 x x", "100 50 25 x x 75 x x 150 125 x x 175 x x", true),
    ];

    for (final step in testCases) {
      final p = TreeNode.fromString(step.a);
      final q = TreeNode.fromString(step.b);
      final expected = step.expected;
      test("\n\tGiven: the trees $p and $q.\n\tThen: they are the same $expected.", () {
        bool actual = isSameTree(p, q);
        expect(actual, equals(expected));
      });
    }
  });
}
