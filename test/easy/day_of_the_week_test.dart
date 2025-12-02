import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/day_of_the_week.dart';

class DayOfTheWeekTestCases {
  int day;
  int month;
  int year;
  String expected;

  DayOfTheWeekTestCases(this.day, this.month, this.year, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      DayOfTheWeekTestCases(31, 8, 2019, "Saturday"),
      DayOfTheWeekTestCases(18, 7, 1999, "Sunday"),
      DayOfTheWeekTestCases(15, 8, 1993, "Sunday"),
      DayOfTheWeekTestCases(29, 2, 2016, "Monday"),
      DayOfTheWeekTestCases(1, 1, 1971, "Friday"),
      DayOfTheWeekTestCases(31, 12, 1971, "Friday"),
      DayOfTheWeekTestCases(1, 1, 2100, "Friday"),
      DayOfTheWeekTestCases(31, 12, 2100, "Friday"),
      DayOfTheWeekTestCases(29, 2, 1972, "Tuesday"),
      DayOfTheWeekTestCases(29, 2, 2000, "Tuesday"),
      DayOfTheWeekTestCases(1, 3, 2100, "Monday"),
      DayOfTheWeekTestCases(1, 3, 2020, "Sunday"),
      DayOfTheWeekTestCases(31, 3, 2020, "Tuesday"),
      DayOfTheWeekTestCases(28, 2, 2019, "Thursday"),
      DayOfTheWeekTestCases(1, 3, 2019, "Friday"),
      DayOfTheWeekTestCases(29, 2, 2020, "Saturday"),
      DayOfTheWeekTestCases(1, 3, 2020, "Sunday"),
      DayOfTheWeekTestCases(4, 7, 1976, "Sunday"),
      DayOfTheWeekTestCases(1, 1, 2000, "Saturday"),
      DayOfTheWeekTestCases(11, 9, 2001, "Tuesday"),
      DayOfTheWeekTestCases(30, 12, 1999, "Thursday"),
      DayOfTheWeekTestCases(31, 12, 1999, "Friday"),
      DayOfTheWeekTestCases(1, 1, 2000, "Saturday"),
      DayOfTheWeekTestCases(30, 4, 2021, "Friday"),
      DayOfTheWeekTestCases(1, 5, 2021, "Saturday"),
      DayOfTheWeekTestCases(2, 5, 2021, "Sunday"),
      DayOfTheWeekTestCases(10, 10, 2010, "Sunday"),
      DayOfTheWeekTestCases(14, 2, 2023, "Tuesday"),
      DayOfTheWeekTestCases(25, 12, 1995, "Monday"),
    ];

    for (final step in testCases) {
      final day = step.day;
      final month = step.month;
      final year = step.year;
      final expected = step.expected;
      test("\n\tGiven: the day: $day - month: $month - year: $year.\n\tThen: if falls on  the $expected day of the week.", () {
        String actual = dayOfTheWeek(day, month, year);
        expect(actual, equals(expected));
      });
    }
  });
}
