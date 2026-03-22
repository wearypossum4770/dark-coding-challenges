
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeBackspaceCompareTest {
    @ParameterizedTest
    @MethodSource("backspaceCompareData")
    fun kodeeBackspaceCompareTest(
        s: String,
        t: String,
        expected: Boolean,
    ) {
        val result = kodeeBackspaceCompare(s, t)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun backspaceCompareData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("y#fo##f", "y#f#o##f", true),
                Arguments.of("a##c", "#a#c", false),
                Arguments.of("ab#c", "ad#c", true),
                Arguments.of("ab##", "c#d#", true),
                Arguments.of("a#c", "b", false),
                Arguments.of("a", "a", true),
                Arguments.of("a", "b", false),
                Arguments.of("#", "#", true),
                Arguments.of("#a", "a", true),
                Arguments.of("a#", "", true),
                Arguments.of("a#", "#", true),
                Arguments.of("##", "#", true),
                Arguments.of("###", "##", true),
                Arguments.of("a##", "#", true),
                Arguments.of("a##", "", true),
                Arguments.of("a#b", "b", true),
                Arguments.of("a#b", "a", false),
                Arguments.of("abc", "abc", true),
                Arguments.of("abc", "abd", false),
                Arguments.of("ab#c", "ab#c", true),
                Arguments.of("ab##c", "c", true),
                Arguments.of("a#b#c#", "", true),
                Arguments.of("a#b#c#d", "d", true),
                Arguments.of("a#b#c#d", "e", false),
                Arguments.of("#a#b#", "", true),
                Arguments.of("bxj##tw", "bxj##tw", true),
                Arguments.of("bxj##tw", "bxk##tw", true),
                Arguments.of("xywrrmp", "xywrrmu", false),
                Arguments.of("xywrrmp", "xywrrmp", true),
                Arguments.of("a###b", "b", true),
                Arguments.of("a###b", "a", false),
                Arguments.of("####", "", true),
                Arguments.of("####", "####", true),
                Arguments.of("a####", "#", true),
                Arguments.of("ab####", "##", true),
                Arguments.of("nzp#o#g", "b#nzp#o#g", true),
                Arguments.of("bbbextm", "bbb#extm", false),
                Arguments.of("ab#c#", "a", true),
                Arguments.of("a#a#a#", "", true),
                Arguments.of("abc##", "a", true),
                Arguments.of("abc###", "", true),
                Arguments.of("", "#", true),
                Arguments.of("#", "", true),
            )
    }
}
