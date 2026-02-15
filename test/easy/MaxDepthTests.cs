namespace DarkCodingChallenges.easy.test;
using DataStructures;
using Easy;
public class MaxDepthTests
{
    public static IEnumerable<object[]> TestData =>
        new List<object[]>
                {
new object[]{new int?[]{3,9,20,null,null,15,7}, 3},
new object[]{new int?[]{1,null,2}, 2},
new object[]{new int?[]{1}, 1},
new object[]{ Array.Empty<int?>(), 0},
new object[]{new int?[]{1,2, null, 3, null, 4, null, 5}, 5},
new object[]{new int?[]{1, null, 2, null, 3, null, 4, null, 5}, 5},
new object[]{new int?[]{1,2,3,4,5,6,7}, 3},
new object[]{new int?[]{1,2,3,4,5,6,null}, 3},
new object[]{new int?[]{5,4,6,3,null,null,7,null,2}, 4},
new object[]{new int?[]{-100,-100,-100,-100,-100}, 3},
new object[]{new int?[]{0}, 1},
new object[]{new int?[]{100}, 1},
new object[]{new int?[]{10,20,null,30,null,40,null,50}, 5},
                };
    [Theory]
    [MemberData(nameof(TestData))]

    public void Solve_ShouldReturnInput(int?[] nums, int expected)
    {
        var root = TreeNode.FromIntegerList(nums);
        var instance = new Easy.MaxDepth();
        var result = instance.Solve(root);
        Assert.Equal(expected, result);
    }
}
