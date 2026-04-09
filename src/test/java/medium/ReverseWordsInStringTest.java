package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ReverseWordsInStringTest {
  ReverseWordsInString instance = new ReverseWordsInString();

  @ParameterizedTest
  @MethodSource("dataReverseWordsInString")
  public void testReverseWordsInString(String s, String expected) {

    String result = instance.solve(s);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataReverseWordsInString() {
    return Stream.of(
        Arguments.of("the sky is blue", "blue is sky the"),
        Arguments.of("  hello world  ", "world hello"),
        Arguments.of("a good   example", "example good a"),
        Arguments.of("a", "a"),
        Arguments.of(" a", "a"),
        Arguments.of("a ", "a"),
        Arguments.of(" a ", "a"),
        Arguments.of("  a  ", "a"),
        Arguments.of("hello world", "world hello"),
        Arguments.of("one two three four five", "five four three two one"),
        Arguments.of("  spaces   between   words  ", "words between spaces"),
        Arguments.of("word", "word"),
        Arguments.of("  word  ", "word"),
        Arguments.of("a b", "b a"),
        Arguments.of("a  b", "b a"),
        Arguments.of("a   b   c", "c b a"),
        Arguments.of("Hello World", "World Hello"),
        Arguments.of("UPPER LOWER", "LOWER UPPER"),
        Arguments.of("camelCase pascalCase", "pascalCase camelCase"),
        Arguments.of("abc123 456def", "456def abc123"),
        Arguments.of("foo1 bar2 baz3", "baz3 bar2 foo1"),
        Arguments.of("a1b2c3 d4e5f6 g7h8i9", "g7h8i9 d4e5f6 a1b2c3"),
        Arguments.of("123 456 789", "789 456 123"),
        Arguments.of("1", "1"),
        Arguments.of(" 1 ", "1"),
        Arguments.of("  1  2  3  ", "3 2 1"),
        Arguments.of("the   sky   is   blue", "blue is sky the"),
        Arguments.of("Alice Bob Charlie Dave Eve", "Eve Dave Charlie Bob Alice"),
        Arguments.of(
            "foo bar baz qux quux corge grault garply waldo fred",
            "fred waldo garply grault corge quux qux baz bar foo"),
        Arguments.of("  leading", "leading"),
        Arguments.of("trailing  ", "trailing"),
        Arguments.of("  both  ", "both"),
        Arguments.of("a  b  c  d  e", "e d c b a"),
        Arguments.of("ab cd ef gh ij kl mn op qr st", "st qr op mn kl ij gh ef cd ab"),
        Arguments.of("MixED cAsE wOrDs", "wOrDs cAsE MixED"),
        Arguments.of("x", "x"),
        Arguments.of(" x ", "x"),
        Arguments.of("x y", "y x"),
        Arguments.of(" x  y ", "y x"),
        Arguments.of("a b c", "c b a"),
        Arguments.of(" a  b  c ", "c b a"),
        Arguments.of("word1   word2   word3", "word3 word2 word1"),
        Arguments.of("  first   second   third  ", "third second first"),
        Arguments.of("aA bB cC dD", "dD cC bB aA"),
        Arguments.of(
            "z y x w v u t s r q p o n m l k j i h g f e d c b a",
            "a b c d e f g h i j k l m n o p q r s t u v w x y z"),
        Arguments.of(
            " gtUGyw       sQ       ZaYYygdFe    Rep6lU  o z      QcspISw       k0b9Ts   KkkRVXY7   OUVxX1zsUL      aQ7iiTy      nKCtoS8       Jp  15uAqvNl   W9Mqf7cep    c      WZJ0M3Z       kX       J     en       wUb6 yY     9v      6eq hQs UmNRei   qEjVjL      xmhQMptz   kT     VBLWqIJXRi       qM      L3jQ78    p    TZH     glfOAYah40   GsaSwLnOs     zIiIXd     YgHsUKFd     i7      0       11lASBGl   LKg3a    LDtzIOvWLt   vPKksW Aa  LFTT      M6FyWJ  y5j02N      lKw sBmxVa1Eh     eLl uM2P  q4    7W8r   GV9    KipYyS0 S pA",
            "pA S KipYyS0 GV9 7W8r q4 uM2P eLl sBmxVa1Eh lKw y5j02N M6FyWJ LFTT Aa vPKksW LDtzIOvWLt LKg3a 11lASBGl 0 i7 YgHsUKFd zIiIXd GsaSwLnOs glfOAYah40 TZH p L3jQ78 qM VBLWqIJXRi kT xmhQMptz qEjVjL UmNRei hQs 6eq 9v yY wUb6 en J kX WZJ0M3Z c W9Mqf7cep 15uAqvNl Jp nKCtoS8 aQ7iiTy OUVxX1zsUL KkkRVXY7 k0b9Ts QcspISw z o Rep6lU ZaYYygdFe sQ gtUGyw"));
  }
}
