package easy

import org.junit.jupiter.api.Assertions.assertArrayEquals
import org.junit.jupiter.api.parallel.Execution
import org.junit.jupiter.api.parallel.ExecutionMode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.CsvSource

@Execution(ExecutionMode.CONCURRENT)
class TwoSumKotlinTest {
    @ParameterizedTest
    @CsvSource("2,7,11,15;9;0;1", "3,2,4;6;1;2", "3,3;6;0;1", delimiter = ';')
    fun testTwoSum(
        numsStr: String,
        target: Int,
        expectedIndex1: Int,
        expectedIndex2: Int,
    ) {
        val nums = numsStr.split(',').map { it.toInt() }.toIntArray()
        val expected = intArrayOf(expectedIndex1, expectedIndex2)
        val result = easy.TwoSum.twoSum(nums, target)
        assertArrayEquals(expected, result)
    }
}
