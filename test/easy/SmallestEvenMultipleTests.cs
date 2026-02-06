namespace Easy;

public class SmallestEvenMultipleTests
{
    [Theory]
    [InlineData(1, 2)]
    [InlineData(2, 2)]
    [InlineData(3, 6)]
    [InlineData(4, 4)]
    [InlineData(5, 10)]
    [InlineData(6, 6)]
    [InlineData(7, 14)]
    [InlineData(8, 8)]
    [InlineData(9, 18)]
    [InlineData(10, 10)]
    [InlineData(11, 22)]
    [InlineData(12, 12)]
    [InlineData(13, 26)]
    [InlineData(14, 14)]
    [InlineData(15, 30)]
    [InlineData(16, 16)]
    [InlineData(17, 34)]
    [InlineData(18, 18)]
    [InlineData(19, 38)]
    [InlineData(20, 20)]
    [InlineData(149, 298)]
    [InlineData(150, 150)]
    public void Solve_ShouldReturnInput(int input, int expected)
    {
        var actual = SmallestEvenMultiple.Solve(input);
        Assert.Equal(expected, actual);
    }
}
