import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/sum_of_multiples.dart';

class SumOfMultiplesTestCases {
  int factor;
  int expected;
  SumOfMultiplesTestCases(this.factor, this.expected);
}

void main() {
  group("\n\tFeature: Array of multiples", () {
    final testCases = [
        SumOfMultiplesTestCases(1, 0),   
        SumOfMultiplesTestCases(2, 0),   
        SumOfMultiplesTestCases(3, 3),   
        SumOfMultiplesTestCases(5, 8),   
        SumOfMultiplesTestCases(7, 21),  
        SumOfMultiplesTestCases(9, 30),  
        SumOfMultiplesTestCases(10, 40), 
        SumOfMultiplesTestCases(12, 52), 
        SumOfMultiplesTestCases(15, 81), 
        SumOfMultiplesTestCases(20, 119), 
        SumOfMultiplesTestCases(21, 140),
        SumOfMultiplesTestCases(50, 691),
        SumOfMultiplesTestCases(100, 2_838),
        SumOfMultiplesTestCases(1_000, 272_066),
        SumOfMultiplesTestCases(200, 10_845),
    ];
    for (final step in testCases) {
      final factor = step.factor;
      final expected = step.expected;
      test("\n\tGiven a factor of $factor.\n\tThen its total of factors of 3/5/7 are $expected", () {
        int result = sumOfMultiples(factor);
        expect(result, equals(expected));
      });
    }
  });
}
