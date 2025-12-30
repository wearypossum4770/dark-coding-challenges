package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MaskingPersonallyIdentifiableInformationTest {
  MaskingPersonallyIdentifiableInformation instance =
      new MaskingPersonallyIdentifiableInformation();

  @ParameterizedTest
  @MethodSource("dataMaskingPersonallyIdentifiableInformation")
  public void testMaskingPersonallyIdentifiableInformation(String s, String expected) {

    String result = instance.solve(s);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataMaskingPersonallyIdentifiableInformation() {
    return Stream.of(
        Arguments.of("LeetCode@LeetCode.com", "l*****e@leetcode.com"),
        Arguments.of("ABracadabraB@qq.com", "a*****b@qq.com"),
        Arguments.of("applesnap@b.com", "a*****p@b.com"),
        Arguments.of("John.Doe@Example.COM", "j*****e@example.com"),
        Arguments.of("XanaxAlprazolam@Y.Z", "x*****m@y.z"),
        Arguments.of("1234567890", "***-***-7890"),
        Arguments.of("1(234)567-890", "***-***-7890"),
        Arguments.of("86-(10)12345678", "+**-***-***-5678"),
        Arguments.of("+86(88)1513-7-74", "+*-***-***-3774"),
        Arguments.of("(123) 456 7890", "***-***-7890"),
        Arguments.of("123-45-67890", "***-***-7890"),
        Arguments.of("0000000000", "***-***-0000"),
        Arguments.of("+000000000000", "+**-***-***-0000"),
        Arguments.of("Zatarans@Z.Z", "z*****s@z.z"));
  }
}
