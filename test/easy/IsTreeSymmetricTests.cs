namespace DarkCodingChallenges.easy.test;
using DataStructures;
using Easy;

public class IsTreeSymmetricTests {
	public static TheoryData<int?[], bool> IsTreeSymmetricData => new()
	{
	{new int?[]{1,2,2,3,4,4,3,5,6,7,8,8,7,6,5}, true},
	{new int?[]{1,2,2,3,4,4,3}, true},
	{Array.Empty<int?>(), true},
	{new int?[]{1}, true},
	{new int?[]{1, 2, 2}, true},
	{new int?[]{1, 2, 3}, false},
	{new int?[]{1, 2, 2, 3, 4, 4, 3}, true},
	{new int?[]{1, 2, 2, 3, 4, 4, 5}, false},
	{new int?[]{1, 2, 2, 3, null, null, 3}, true},
	{new int?[]{1, 2, 2, null, 3, null, 3}, false},
	{new int?[]{1, 2, 2, 3, 3, null, null}, false},
	{new int?[]{1, null, null}, true},
	{new int?[]{1, 2, null}, false},
	{new int?[]{1, null, 2}, false},
	{new int?[]{1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 6, 5}, false},
	{new int?[]{1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 7, 5}, false},
	{new int?[]{0}, true},
	{new int?[]{0, 0, 0}, true},
	{new int?[]{0, 0, 1}, false},
	{new int?[]{1, 2, 2, 2, 2, 2, 2}, true},
	{new int?[]{1, 2, 3, 4, 5, 6, 7}, false},
	{new int?[]{1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4}, true},
	{new int?[]{5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2}, true},
	{new int?[]{1, 2, null, 3, null, null, null}, false},
	{new int?[]{1, null, null, null, null, null, null}, true},
	{new int?[]{2, 3, 3, 4, 5, 5, 4, 6, 7, 8, 8, 7, 6}, false},
	{new int?[]{1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5}, true},
	{new int?[]{1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 6}, false},
	{new int?[]{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, true},
	};

	[Theory]
	[MemberData(nameof(IsTreeSymmetricData))]

	public void ShouldCheckTreeSymmetry(int?[] nums, bool expected) {
	var instance = new IsTreeSymmetric();
	var root = DataStructures.TreeNode.FromIntegerList(nums);
	var result = instance.Solve(root);
	Assert.Equal(expected, result);
	}
}
