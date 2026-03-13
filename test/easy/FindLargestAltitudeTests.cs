namespace Easy;

public class FindLargestAltitudeTests
{
    public static TheoryData<int[], int> FindLargestAltitudeData =>
        new()
        {
            { [-5, 1, 5, 0, -7], 1 },
            { [-4, -3, -2, -1, 4, 3, 2], 0 },
            { [0], 0 },
            { [100], 100 },
            { [-100], 0 },
            { [1], 1 },
            { [0, 0, 0, 0], 0 },
            { [1, 2, 3, 4, 5], 15 },
            { [-1, -2, -3, -4, -5], 0 },
            { [5, 5, 5, 5], 20 },
            { [-5, -5, -5, -5], 0 },
            { [10, -20, 10], 10 },
            { [1, 1, 1, 1, -100], 4 },
            { [-100, 1, 1, 1, 1], 0 },
            { [50, -100, 50, -100, 50], 50 },
            { [100, -100, -100, -100], 100 },
            { [-1, -1, -1, 1, 1], 0 },
            { [1, -1, 1, -1, 1, -1], 1 },
            { [1, 1, 1, 1, 1], 5 },
            { [-100], 0 },
            { [100], 100 },
        };

    [Theory]
    [MemberData(nameof(FindLargestAltitudeData))]
    public void ShouldFindLargestAltitude(int[] gain, int expected)
    {
        var actual = FindLargestAltitude.Solve(gain);
        Assert.Equal(expected, actual);
    }
}
