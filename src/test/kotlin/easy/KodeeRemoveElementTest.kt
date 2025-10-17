package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals

class KodeeRemoveElementTest {
    @ParameterizedTest
    @MethodSource("removeElementOptionalData")
    fun kodeeRemoveOptionalElementTest(
        nums: Array<Int?>,
        subject: Int,
        expected: Int,
        output: Array<Int?>,
    ) {
        val result = kodeeRemoveOptionalElement(nums, subject)
        assertEquals(expected, result)
        assertContentEquals(nums, output, "Array are not equal")
    }

    fun kodeeRemoveElementTest(
        nums: Array<Int>,
        subject: Int,
        expected: Int,
        output: Array<Int>,
    ) {
        val result = kodeeRemoveElement(nums, subject)
        assertEquals(expected, result)
        assertContentEquals(nums, output, "Array are not equal")
    }

    companion object {
        @JvmStatic
        fun removeElementData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf(3, 2, 2, 3), 3, 2, arrayOf(2, 2)),
                Arguments.of(arrayOf(0, 1, 2, 2, 3, 0, 4, 2), 2, 5, arrayOf(0, 1, 3, 0, 4)),
            )

        @JvmStatic
        fun removeElementOptionalData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf(3, 2, 2, 3), 3, 2, arrayOf(null, 2, 2, null)),
                Arguments.of(
                    arrayOf(0, 1, 2, 2, 3, 0, 4, 2),
                    2,
                    5,
                    arrayOf(0, 1, null, null, 3, 0, 4, null),
                ),
            )
    }
}
