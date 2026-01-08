package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindDuplicateNumberTest {
    FindDuplicateNumber instance = new FindDuplicateNumber();

    @ParameterizedTest
    @MethodSource("dataFindDuplicateNumber")
    public void testFindDuplicateNumber(int[] nums, int expected) {

        int result = instance.solve(nums);

        assertEquals(expected, result);
    }

    public static Stream<Arguments> dataFindDuplicateNumber() {
        return Stream.of(
                Arguments.of(new int[] {1, 1}, 1),
                Arguments.of(new int[] {1, 3, 4, 2, 2}, 2),
                Arguments.of(new int[] {3, 1, 3, 4, 2}, 3),
                Arguments.of(new int[] {3, 3, 3, 3, 3}, 3),
                Arguments.of(new int[] {2, 1, 2}, 2),
                Arguments.of(new int[] {1, 4, 6, 3, 2, 5, 6}, 6),
                Arguments.of(new int[] {5, 4, 3, 2, 1, 5}, 5),
                Arguments.of(new int[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 9}, 9),
                Arguments.of(new int[] {2, 2, 2, 2, 2}, 2),
                Arguments.of(new int[] {1, 1, 2, 3, 4, 5}, 1),
                Arguments.of(new int[] {4, 3, 1, 4, 2}, 4),
                Arguments.of(new int[] {6, 1, 5, 4, 3, 2, 6}, 6),
                Arguments.of(new int[] {1, 2, 3, 4, 5, 3}, 3),
                Arguments.of(new int[] {7, 6, 5, 4, 3, 2, 1, 7}, 7));
    }
}
