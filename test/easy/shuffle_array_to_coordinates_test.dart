import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/shuffle_array_to_coordinates.dart';

class ShuffleArrayToCoordinatesTestCases {
  List<int> nums;
  int n;
  List<int> expected;
  ShuffleArrayToCoordinatesTestCases(this.nums, this.n, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      ShuffleArrayToCoordinatesTestCases([2, 5, 1, 3, 4, 7], 3, [2, 3, 5, 4, 1, 7]),
      ShuffleArrayToCoordinatesTestCases([1, 2, 3, 4, 4, 3, 2, 1], 4, [1, 4, 2, 3, 3, 2, 4, 1]),
      ShuffleArrayToCoordinatesTestCases([1, 1, 2, 2], 2, [1, 2, 1, 2]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final n = step.n;
      final expected = step.expected;
      test("\n\tGiven: the array $nums which is 2*$n in length.\n\tThen: it is $expected after the shuffle.", () {
        List<int> actual = shuffleArrayToCoordinates(nums, n);
        expect(actual, equals(expected));
      });
    }
  });
}
