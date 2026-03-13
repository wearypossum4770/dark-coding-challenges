import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_largest_altitude.dart';

class FindLargestAltitudeTestCases {
  List<int> gain;
  int expected;
  FindLargestAltitudeTestCases(this.gain, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      FindLargestAltitudeTestCases([-5, 1, 5, 0, -7], 1),
      FindLargestAltitudeTestCases([-4, -3, -2, -1, 4, 3, 2], 0),
      FindLargestAltitudeTestCases([0], 0),
      FindLargestAltitudeTestCases([100], 100),
      FindLargestAltitudeTestCases([-100], 0),
      FindLargestAltitudeTestCases([1], 1),
      FindLargestAltitudeTestCases([0, 0, 0, 0], 0),
      FindLargestAltitudeTestCases([1, 2, 3, 4, 5], 15),
      FindLargestAltitudeTestCases([-1, -2, -3, -4, -5], 0),
      FindLargestAltitudeTestCases([5, 5, 5, 5], 20),
      FindLargestAltitudeTestCases([-5, -5, -5, -5], 0),
      FindLargestAltitudeTestCases([10, -20, 10], 10),
      FindLargestAltitudeTestCases([1, 1, 1, 1, -100], 4),
      FindLargestAltitudeTestCases([-100, 1, 1, 1, 1], 0),
      FindLargestAltitudeTestCases([50, -100, 50, -100, 50], 50),
      FindLargestAltitudeTestCases([100, -100, -100, -100], 100),
      FindLargestAltitudeTestCases([-1, -1, -1, 1, 1], 0),
      FindLargestAltitudeTestCases([1, -1, 1, -1, 1, -1], 1),
      FindLargestAltitudeTestCases([1, 1, 1, 1, 1], 5),
      FindLargestAltitudeTestCases([-100], 0),
      FindLargestAltitudeTestCases([100], 100),
    ];

    for (final step in testCases) {
      final gain = step.gain;
      final expected = step.expected;
      test("\n\tGiven: the altitude points $gain\n\tThen: the max altitude is $expected.", () {
        int actual = findLargestAltitude(gain);
        expect(actual, equals(expected));
      });
    }
  });
}
