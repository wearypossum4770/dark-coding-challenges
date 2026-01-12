package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class RelativeSortArrayTest {
    RelativeSortArray instance = new RelativeSortArray();

    @ParameterizedTest(name = "[{index}] {0}")
    @MethodSource("dataRelativeSortArray")
    @DisplayName(
            "Given: an input array with duplicates and mixed order\n\tAnd: a second array defining the desired relative order\n\tWhen: we perform relative sorting\n\tThen: elements from the second array appear first in the specified order,\n\tfollowed by remaining elements sorted in ascending order")
    public void testRelativeSortArray(int[] arr1, int[] arr2, int[] expected) {

        int[] result = instance.solve(arr1, arr2);

        assertArrayEquals(expected, result);
    }

    public static Stream<Arguments> dataRelativeSortArray() {
        return Stream.of(
                Arguments.of(new int[] {2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19}, new int[] {2, 1, 4, 3, 9, 6}, new int[] {
                    2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19
                }),
                Arguments.of(
                        new int[] {28, 6, 22, 8, 44, 17}, new int[] {22, 28, 8, 6}, new int[] {22, 28, 8, 6, 17, 44}),
                Arguments.of(new int[] {5, 3, 8, 1, 9, 2}, new int[] {}, new int[] {1, 2, 3, 5, 8, 9}),
                Arguments.of(new int[] {5, 5, 2, 2, 8, 8}, new int[] {2, 5, 8}, new int[] {2, 2, 5, 5, 8, 8}),
                Arguments.of(new int[] {42}, new int[] {42}, new int[] {42}),
                Arguments.of(new int[] {100, 1, 100, 2}, new int[] {1, 2}, new int[] {1, 2, 100, 100}),
                Arguments.of(new int[] {3, 3, 3, 3, 3}, new int[] {3}, new int[] {3, 3, 3, 3, 3}),
                Arguments.of(new int[] {0}, new int[] {0}, new int[] {0}),
                Arguments.of(new int[] {}, new int[] {1, 2, 3}, new int[] {}),
                Arguments.of(new int[] {7, 1, 7, 1, 7}, new int[] {7, 1}, new int[] {7, 7, 7, 1, 1}),
                Arguments.of(new int[] {999, 0, 500, 1000, 0}, new int[] {0, 1000}, new int[] {0, 0, 1000, 500, 999}),
                Arguments.of(new int[] {1, 2, 3, 4, 5}, new int[] {5, 4, 3, 2, 1}, new int[] {5, 4, 3, 2, 1}));
    }
}
