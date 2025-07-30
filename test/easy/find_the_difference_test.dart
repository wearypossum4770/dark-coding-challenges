import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/find_the_difference.dart';
class FindTheDifferenceTestCases {
	String s;
	String t;
	String expected;
	FindTheDifferenceTestCases(this.s, this.t, this.expected);
}
void main(){
group("Find The Difference:", () {
final testCases = [
	FindTheDifferenceTestCases("abcd", "abcde", 'e'),
	FindTheDifferenceTestCases("", "y", 'y'),
	FindTheDifferenceTestCases("a", "aa", 'a'),
	FindTheDifferenceTestCases("aabbcc", "aabbccd", 'd'),
];

for (final step in testCases) {
final s = step.s;
final t = step.t;
final expected = step.expected;

test("should findTheDifference($s,$t) == $expected", () {
String result = findTheDifference(s, t);
expect(result, equals(expected));
});
}
});}