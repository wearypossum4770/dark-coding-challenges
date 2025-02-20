package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.CsvSource
import kotlin.test.assertEquals

class IsNumberPalindromeTest {
    @ParameterizedTest
    @CsvSource(
        "-121, false",
        "121, true",
        "10, false",
        "-101, false",
        "-10, false",
        "-1, false",
        "0, true",
        "3, true",
        "8, true",
        "9, true",
        "11, true",
        "100, false",
        "1, true",
        "123, false",
        "313, true",
        "1000030001, false",
        "1000021, false",
        "1611881161, true",
    )
    fun testPalindromeNumber(
        candidate: Int,
        expected: Boolean,
    ) {
        val result = isNumberPalindrome(candidate)
        // Assert
        assertEquals(expected, result)
    }
}
