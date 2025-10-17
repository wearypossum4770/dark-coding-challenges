package easy

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream

class KodeeFizzBuzzTest {
    @ParameterizedTest
    @MethodSource("fixtureMethod")
    fun testFizzBuzz(
        candidate: Int,
        expected: List<String>,
    ) {
        val result = kodeeFizzBuzz(candidate)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun fixtureMethod(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    5,
                    // spotless:off
                listOf("1", "2", "Fizz", "4", "Buzz"),
                // spotless:on
                ),
                Arguments.of(
                    3,
                    // spotless:off
                listOf("1", "2", "Fizz"),
                // spotless:on
                ),
                Arguments.of(
                    10,
                    // spotless:off
                listOf("1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz"),
                // spotless:on
                ),
                Arguments.of(
                    16,
                    // spotless:off
                listOf(
                    "1",
                    "2",
                    "Fizz",
                    "4",
                    "Buzz",
                    "Fizz",
                    "7",
                    "8",
                    "Fizz",
                    "Buzz",
                    "11",
                    "Fizz",
                    "13",
                    "14",
                    "FizzBuzz",
                    "16"),
                // spotless:on
                ),
                Arguments.of(
                    15,
                    // spotless:off
                listOf(
                    "1",
                    "2",
                    "Fizz",
                    "4",
                    "Buzz",
                    "Fizz",
                    "7",
                    "8",
                    "Fizz",
                    "Buzz",
                    "11",
                    "Fizz",
                    "13",
                    "14",
                    "FizzBuzz"),
                // spotless:on
                ),
                Arguments.of(
                    35,
                    // spotless:off
                listOf(
                    "1",
                    "2",
                    "Fizz",
                    "4",
                    "Buzz",
                    "Fizz",
                    "7",
                    "8",
                    "Fizz",
                    "Buzz",
                    "11",
                    "Fizz",
                    "13",
                    "14",
                    "FizzBuzz",
                    "16",
                    "17",
                    "Fizz",
                    "19",
                    "Buzz",
                    "Fizz",
                    "22",
                    "23",
                    "Fizz",
                    "Buzz",
                    "26",
                    "Fizz",
                    "28",
                    "29",
                    "FizzBuzz",
                    "31",
                    "32",
                    "Fizz",
                    "34",
                    "Buzz",
                ),
                // spotless:on
                ),
            )
    }
}
