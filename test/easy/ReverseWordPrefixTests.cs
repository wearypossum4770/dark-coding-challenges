namespace Easy;

public class ReverseWordPrefixTests
{
    [Theory]
    [InlineData("abcdefd", 'd', "dcbaefd")]
    [InlineData("xyxzxe", 'z', "zxyxxe")]
    [InlineData("abcd", 'z', "abcd")]
    [InlineData("abcde", 'a', "abcde")]
    [InlineData("aabcd", 'a', "aabcd")]
    [InlineData("abcde", 'e', "edcba")]
    [InlineData("a", 'a', "a")]
    [InlineData("a", 'b', "a")]
    [InlineData("aabcaad", 'a', "aabcaad")]
    [InlineData("abacaba", 'c', "cabaaba")]
    [InlineData("abcdabcd", 'd', "dcbaabcd")]
    [InlineData("dcba", 'a', "abcd")]
    [InlineData("ba", 'a', "ab")]
    [InlineData("aaaa", 'a', "aaaa")]
    [InlineData("aaaa", 'b', "aaaa")]
    [InlineData("abcde", 'b', "bacde")]
    [InlineData("abcde", 'd', "dcbae")]
    [InlineData("ab", 'a', "ab")]
    [InlineData("ab", 'b', "ba")]
    [InlineData("ab", 'z', "ab")]
    [InlineData("racecar", 'e', "ecarcar")]
    [InlineData("racecar", 'r', "racecar")]
    [InlineData("aabba", 'b', "baaba")]
    [InlineData("mnopqrstu", 'u', "utsrqponm")]
    [InlineData("абагд", 'а', "абагд")]
    [InlineData("а", 'а', "а")]
    [InlineData("а", 'б', "а")]
    [InlineData("аб", 'а', "аб")]
    [InlineData("аааа", 'а', "аааа")]
    [InlineData("аааа", 'б', "аааа")]
    [InlineData("abcde", 'а', "abcde")]
    public void ShouldReverseWordPrefix(string word, char c, string expected)
    {
        var actual = ReverseWordPrefix.Solve(word, c);
        Assert.Equal(expected, actual);
    }
}
