namespace Medium;

public class ReverseWordsInStringTests
{
    [Theory]
    [InlineData("the sky is blue", "blue is sky the")]
    [InlineData("  hello world  ", "world hello")]
    [InlineData("a good   example", "example good a")]
    [InlineData("a", "a")]
    [InlineData(" a", "a")]
    [InlineData("a ", "a")]
    [InlineData(" a ", "a")]
    [InlineData("  a  ", "a")]
    [InlineData("hello world", "world hello")]
    [InlineData("one two three four five", "five four three two one")]
    [InlineData("  spaces   between   words  ", "words between spaces")]
    [InlineData("word", "word")]
    [InlineData("  word  ", "word")]
    [InlineData("a b", "b a")]
    [InlineData("a  b", "b a")]
    [InlineData("a   b   c", "c b a")]
    [InlineData("Hello World", "World Hello")]
    [InlineData("UPPER LOWER", "LOWER UPPER")]
    [InlineData("camelCase pascalCase", "pascalCase camelCase")]
    [InlineData("abc123 456def", "456def abc123")]
    [InlineData("foo1 bar2 baz3", "baz3 bar2 foo1")]
    [InlineData("a1b2c3 d4e5f6 g7h8i9", "g7h8i9 d4e5f6 a1b2c3")]
    [InlineData("123 456 789", "789 456 123")]
    [InlineData("1", "1")]
    [InlineData(" 1 ", "1")]
    [InlineData("  1  2  3  ", "3 2 1")]
    [InlineData("the   sky   is   blue", "blue is sky the")]
    [InlineData("Alice Bob Charlie Dave Eve", "Eve Dave Charlie Bob Alice")]
    [InlineData(
        "foo bar baz qux quux corge grault garply waldo fred",
        "fred waldo garply grault corge quux qux baz bar foo"
    )]
    [InlineData("  leading", "leading")]
    [InlineData("trailing  ", "trailing")]
    [InlineData("  both  ", "both")]
    [InlineData("a  b  c  d  e", "e d c b a")]
    [InlineData("ab cd ef gh ij kl mn op qr st", "st qr op mn kl ij gh ef cd ab")]
    [InlineData("MixED cAsE wOrDs", "wOrDs cAsE MixED")]
    [InlineData("x", "x")]
    [InlineData(" x ", "x")]
    [InlineData("x y", "y x")]
    [InlineData(" x  y ", "y x")]
    [InlineData("a b c", "c b a")]
    [InlineData(" a  b  c ", "c b a")]
    [InlineData("word1   word2   word3", "word3 word2 word1")]
    [InlineData("  first   second   third  ", "third second first")]
    [InlineData("aA bB cC dD", "dD cC bB aA")]
    [InlineData(
        "z y x w v u t s r q p o n m l k j i h g f e d c b a",
        "a b c d e f g h i j k l m n o p q r s t u v w x y z"
    )]
    [InlineData(
        " gtUGyw       sQ       ZaYYygdFe    Rep6lU  o z      QcspISw       k0b9Ts   KkkRVXY7   OUVxX1zsUL      aQ7iiTy      nKCtoS8       Jp  15uAqvNl   W9Mqf7cep    c      WZJ0M3Z       kX       J     en       wUb6 yY     9v      6eq hQs UmNRei   qEjVjL      xmhQMptz   kT     VBLWqIJXRi       qM      L3jQ78    p    TZH     glfOAYah40   GsaSwLnOs     zIiIXd     YgHsUKFd     i7      0       11lASBGl   LKg3a    LDtzIOvWLt   vPKksW Aa  LFTT      M6FyWJ  y5j02N      lKw sBmxVa1Eh     eLl uM2P  q4    7W8r   GV9    KipYyS0 S pA",
        "pA S KipYyS0 GV9 7W8r q4 uM2P eLl sBmxVa1Eh lKw y5j02N M6FyWJ LFTT Aa vPKksW LDtzIOvWLt LKg3a 11lASBGl 0 i7 YgHsUKFd zIiIXd GsaSwLnOs glfOAYah40 TZH p L3jQ78 qM VBLWqIJXRi kT xmhQMptz qEjVjL UmNRei hQs 6eq 9v yY wUb6 en J kX WZJ0M3Z c W9Mqf7cep 15uAqvNl Jp nKCtoS8 aQ7iiTy OUVxX1zsUL KkkRVXY7 k0b9Ts QcspISw z o Rep6lU ZaYYygdFe sQ gtUGyw"
    )]
    public void ShouldReverseWordsInString(string s, string expected)
    {
        var actual = ReverseWordsInString.Solve(s);
        Assert.Equal(expected, actual);
    }
}
