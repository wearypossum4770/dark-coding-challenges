import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/reformat_date.dart';

class ReformatDateTestCases {
  String date;
  String expected;
  ReformatDateTestCases(this.date, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      ReformatDateTestCases("20th Oct 2052", "2052-10-20"),
      ReformatDateTestCases("6th Jun 1933", "1933-06-06"),
      ReformatDateTestCases("26th May 1960", "1960-05-26"),
      ReformatDateTestCases("1st Jan 1900", "1900-01-01"),
      ReformatDateTestCases("31st Dec 2100", "2100-12-31"),
      ReformatDateTestCases("2nd Feb 2000", "2000-02-02"),
      ReformatDateTestCases("3rd Mar 1999", "1999-03-03"),
      ReformatDateTestCases("4th Apr 2010", "2010-04-04"),
      ReformatDateTestCases("9th Sep 2021", "2021-09-09"),
      ReformatDateTestCases("10th Oct 2020", "2020-10-10"),
      ReformatDateTestCases("11th Nov 2011", "2011-11-11"),
      ReformatDateTestCases("12th Dec 2012", "2012-12-12"),
      ReformatDateTestCases("21st Aug 1987", "1987-08-21"),
      ReformatDateTestCases("22nd Jul 1975", "1975-07-22"),
      ReformatDateTestCases("23rd Mar 1965", "1965-03-23"),
      ReformatDateTestCases("30th Apr 1990", "1990-04-30"),
      ReformatDateTestCases("28th Feb 2001", "2001-02-28"),
      ReformatDateTestCases("29th Feb 2000", "2000-02-29"),
      ReformatDateTestCases("7th Jul 2007", "2007-07-07"),
      ReformatDateTestCases("8th Aug 1988", "1988-08-08"),
    ];

    for (final step in testCases) {
      final date = step.date;
      final expected = step.expected;
      test("\n\tGiven: the date $date.\n\tThen: it is $expected after reformatting.", () {
        String actual = reformatDate(date);
        expect(actual, equals(expected));
      });
    }
  });
}
