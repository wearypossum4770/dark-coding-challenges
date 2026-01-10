package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;
import java.util.stream.Stream;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ArrayPairSumTest {
    private final ArrayPairSum instance = new ArrayPairSum();

    @ParameterizedTest(name = "[{index}] nums={0} → expected sum = {1}")
    @MethodSource("dataArrayPairSum")
    @DisplayName("Array Partition I - Maximize sum of min(ai, bi)")
    public void testArrayPairSum(int[] nums, int expected) {

        int result = instance.solve(nums);

        assertEquals(
                expected,
                result,
                () -> String.format("For input %s, expected %d  but got %d", Arrays.toString(nums), expected, result));
    }

    public static Stream<Arguments> dataArrayPairSum() {
        return Stream.of(
                Arguments.of(new int[] {1, 4, 3, 2}, 4),
                Arguments.of(new int[] {6, 2, 6, 5, 1, 2}, 9),
                Arguments.of(new int[] {1, 1}, 1),
                Arguments.of(new int[] {0, 0}, 0),
                Arguments.of(new int[] {-1, -1}, -1),
                Arguments.of(new int[] {10_000, 10_000}, 10_000),
                Arguments.of(new int[] {5, 5, 5, 5}, 10),
                Arguments.of(new int[] {7, 7, 7, 7, 7, 7}, 21),
                Arguments.of(new int[] {1, 2, 3, 4, 5, 6}, 9),
                Arguments.of(new int[] {6, 5, 4, 3, 2, 1}, 9),
                Arguments.of(new int[] {-5, -4, -3, -2}, -8),
                Arguments.of(new int[] {-10, -1, 1, 10}, -9),
                Arguments.of(new int[] {-10_000, 10_000, -9_999, 9_999}, -1),
                Arguments.of(new int[] {1, 100, 2, 99, 3, 98}, 100 + 3),
                Arguments.of(new int[] {0, 0, 0, 0, 0, 0}, 0),
                Arguments.of(new int[] {-10_000, 10_000}, -10_000));
    }
}
