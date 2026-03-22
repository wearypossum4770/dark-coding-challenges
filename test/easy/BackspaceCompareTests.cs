namespace Easy;

public class BackspaceCompareTests
{
    [Theory]
    [InlineData("y#fo##f", "y#f#o##f", true)]
    [InlineData("ab#c", "ad#c", true)]
    [InlineData("ab##", "c#d#", true)]
    [InlineData("a#c", "b", false)]
    [InlineData("a", "a", true)]
    [InlineData("a", "b", false)]
    [InlineData("#", "#", true)]
    [InlineData("#a", "a", true)]
    [InlineData("a#", "", true)]
    [InlineData("a#", "#", true)]
    [InlineData("##", "#", true)]
    [InlineData("###", "##", true)]
    [InlineData("a##", "#", true)]
    [InlineData("a##", "", true)]
    [InlineData("a#b", "b", true)]
    [InlineData("a#b", "a", false)]
    [InlineData("abc", "abc", true)]
    [InlineData("abc", "abd", false)]
    [InlineData("ab#c", "ab#c", true)]
    [InlineData("ab##c", "c", true)]
    [InlineData("a#b#c#", "", true)]
    [InlineData("a#b#c#d", "d", true)]
    [InlineData("a#b#c#d", "e", false)]
    [InlineData("#a#b#", "", true)]
    [InlineData("bxj##tw", "bxj##tw", true)]
    [InlineData("bxj##tw", "bxk##tw", true)]
    [InlineData("xywrrmp", "xywrrmu", false)]
    [InlineData("xywrrmp", "xywrrmp", true)]
    [InlineData("a###b", "b", true)]
    [InlineData("a###b", "a", false)]
    [InlineData("####", "", true)]
    [InlineData("####", "####", true)]
    [InlineData("a####", "#", true)]
    [InlineData("ab####", "##", true)]
    [InlineData("nzp#o#g", "b#nzp#o#g", true)]
    [InlineData("bbbextm", "bbb#extm", false)]
    [InlineData("ab#c#", "a", true)]
    [InlineData("a#a#a#", "", true)]
    [InlineData("abc##", "a", true)]
    [InlineData("abc###", "", true)]
    [InlineData("", "#", true)]
    [InlineData("#", "", true)]
    public void ShouldBackspaceCompare(string s, string t, bool expected)
    {
        var actual = BackspaceCompare.Solve(s, t);
        Assert.Equal(expected, actual);
    }
}
