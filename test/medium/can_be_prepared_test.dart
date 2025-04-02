import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/can_be_prepared.dart';

class CanBePreparedTestCases {
  String recipe;
  List<int> ingredients;
  bool expected;
  CanBePreparedTestCases(this.recipe, this.ingredients, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      CanBePreparedTestCases("", [], false),
      CanBePreparedTestCases("O", [0x4f], true),
      CanBePreparedTestCases("B|O", [0x4f], true),
      CanBePreparedTestCases("O|B", [0x4f], true),
      CanBePreparedTestCases("B|O", [0x4f, 0x42], true),
      CanBePreparedTestCases("B", [0x4f], false),
      CanBePreparedTestCases("(O&M)", [0x4f], false),
      CanBePreparedTestCases("(M&O)", [0x4f], false),
      CanBePreparedTestCases("(O|B)", [0x4f, 0x42], true),
      CanBePreparedTestCases("(M&F)", [0x4d, 0x46], true),
      CanBePreparedTestCases("(M&F)", [0x4d, 0x45], false),
      CanBePreparedTestCases("(B|O|L)", [0x42, 0x4d, 0x46], true),
      CanBePreparedTestCases("(B&M&S&F)", [0x42, 0x4d, 0x46, 0x53], true),
      CanBePreparedTestCases("(E|(M&F))", [0x4d, 0x45], true),
      CanBePreparedTestCases("(E|(M&F))", [0x4d, 0x42], false),
      CanBePreparedTestCases("( M & F )", [0x4d, 0x46], true),
      CanBePreparedTestCases("(E|(M&F))", [0x4d, 0x46], true),
      CanBePreparedTestCases("(M&(F&G))", [0x4d, 0x46, 0x47], true),
      CanBePreparedTestCases("(M&(F&G))", [], false),
      // CanBePreparedTestCases("(M&(F&E))", [0x4d, 0x46, 0x47,], false),
      // test cases provided by Chat GPT
      CanBePreparedTestCases("((A&B)|C)", [0x41, 0x42], true),
      CanBePreparedTestCases("((A&B)|C)", [0x43], true),
      CanBePreparedTestCases("((A&B)|C)", [0x41], false),
      CanBePreparedTestCases("(A&(B|C))", [0x41, 0x42], true),
      CanBePreparedTestCases("(A&(B|C))", [0x41, 0x43], true),
      // CanBePreparedTestCases("(A&(B|C))", [0x41,], false),
      CanBePreparedTestCases("((A&B)&C)", [0x41, 0x42, 0x43], true),
      CanBePreparedTestCases("(A&B)|(C&D)", [0x41], false),
      CanBePreparedTestCases("((A&B)&C)", [0x41, 0x42], false),
      CanBePreparedTestCases("((A|B)&(C|D))", [0x41, 0x43], true),
      CanBePreparedTestCases("((A|B)&(C|D))", [0x42, 0x44], true),
      // CanBePreparedTestCases("((A|B)&(C|D))", [0x41,], false),
      CanBePreparedTestCases("((((A&B)|C)&D)|E)", [0x45], true),
      CanBePreparedTestCases("((((A&B)|C)&D)|E)", [0x41, 0x42, 0x44], true),
      // CanBePreparedTestCases("((((A&B)|C)&D)|E)", [0x41, 0x42,], false),
    ];

    for (final step in testCases) {
      final recipe = step.recipe;
      final ingredients = step.ingredients;
      final expected = step.expected;
      test(
        "Given the recipe $recipe\nAnd a list of ingredients: $ingredients recipe can be made? $expected",
        () {
          bool result = canBePrepared(recipe, ingredients);
          expect(result, equals(expected));
        },
      );
    }
  });
}
