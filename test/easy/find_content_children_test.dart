import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_content_children.dart';

class FindContentChildrenTestCase {
  List<int> children;
  List<int> cookies;
  int expected;
  FindContentChildrenTestCase(this.children, this.cookies, this.expected);
}

void main() {
  group("Feature: Find Content Children Challenge", () {
    final testCases = [
      FindContentChildrenTestCase([1, 2, 3], [1, 1], 1),
      FindContentChildrenTestCase([1, 2], [1, 2, 3], 2),
      FindContentChildrenTestCase([10, 9, 8, 7], [5, 6, 7, 8], 2),
      FindContentChildrenTestCase([], [1, 2], 0),
      FindContentChildrenTestCase([1, 2], [], 0),
    ];

    for (final step in testCases) {
      // Safely cast values to List<int> for nums and expected
      final children = step.children;
      final cookies = step.cookies;
      final expected = step.expected;

      test("Testing is the children $children\x1b[0m can be satisfied by cookies $cookies\x1b[0m", () {
        int result = findContentChildren(children, cookies);
        expect(result, equals(expected));
      });
    }
  });
}
