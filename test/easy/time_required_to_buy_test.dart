import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/time_required_to_buy.dart';

class TimeRequiredToBuyTestCases {
  List<int> tickets;
  int k;
  int expected;
  TimeRequiredToBuyTestCases(this.tickets, this.k, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      TimeRequiredToBuyTestCases([2, 3, 2], 2, 6),
      TimeRequiredToBuyTestCases([5, 1, 1, 1], 0, 8),
      TimeRequiredToBuyTestCases([1], 0, 1),
      TimeRequiredToBuyTestCases([1, 1, 1, 1], 3, 4),
      TimeRequiredToBuyTestCases([3, 3, 3], 0, 7),
      TimeRequiredToBuyTestCases([3, 3, 3], 1, 8),
      TimeRequiredToBuyTestCases([3, 3, 3], 2, 9),
      TimeRequiredToBuyTestCases([1, 2, 3, 4], 3, 10),
      TimeRequiredToBuyTestCases([4, 3, 2, 1], 0, 10),
      TimeRequiredToBuyTestCases([4, 3, 2, 1], 1, 9),
      TimeRequiredToBuyTestCases([4, 3, 2, 1], 2, 7),
      TimeRequiredToBuyTestCases([4, 3, 2, 1], 3, 4),
      TimeRequiredToBuyTestCases([100, 100, 100], 1, 299),
      TimeRequiredToBuyTestCases([1, 100, 1], 1, 102),
      TimeRequiredToBuyTestCases([2, 1], 1, 2),
      TimeRequiredToBuyTestCases([2, 1], 0, 3),
      TimeRequiredToBuyTestCases([1, 2], 0, 1),
      TimeRequiredToBuyTestCases([1, 2], 1, 3),
    ];

    for (final step in testCases) {
      final tickets = step.tickets;
      final k = step.k;
      final expected = step.expected;
      test("\n\tGiven: a queue of tickets $tickets with the original ending position of $k.\n\tThen: there will be $expected tickets sold.", () {
        int actual = timeRequiredToBuy(tickets, k);
        expect(actual, equals(expected));
      });
    }
  });
}
