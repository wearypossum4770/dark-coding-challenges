import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/running_array_sum.dart';
class RunningArraySumTestCases {
	String criteria;
	List<int> nums;
	List<int> expected;
	RunningArraySumTestCases(this.criteria, this.nums, this.expected);
}
void main(){
group("Feature:", () {
final testCases = [
	 RunningArraySumTestCases("✅ Normal case", [1, 2, 3, 4], [1, 3, 6, 10]),
  RunningArraySumTestCases("✅ All 1s", [1, 1, 1, 1, 1], [1, 2, 3, 4, 5]),
  RunningArraySumTestCases("✅ Mixed values", [3, 1, 2, 10, 1], [3, 4, 6, 16, 17]),
  RunningArraySumTestCases("🟢 Empty array", [], []),
  RunningArraySumTestCases("🟢 Single element", [5], [5]),
  RunningArraySumTestCases("🟢 Negative numbers", [-1, -2, -3], [-1, -3, -6]),
  RunningArraySumTestCases("🟢 Alternating positives & negatives", [1, -1, 1, -1, 1], [1, 0, 1, 0, 1]),
];

for (final step in testCases) {
final nums = step.nums;
String criteria = step.criteria;
final expected = step.expected;
test("\n\tCriteria: $criteria.\n\tGiven: $nums.\n\tThen: the running sum is $expected", () {
List<int> result = runningArraySum(nums);
expect(result, equals(expected));
});
}
});}