package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MaxIceCreamTest {
    MaxIceCream instance = new MaxIceCream();

    @ParameterizedTest
    @MethodSource("dataMaxIceCream")
    public void testMaxIceCream(int[] costs, int coins, int expected) {

        int result = instance.solve(costs, coins);

        assertEquals(expected, result);
    }

    public static Stream<Arguments> dataMaxIceCream() {
        return Stream.of(
                Arguments.of(new int[] {1, 3, 2, 4, 1}, 7, 4),
                Arguments.of(new int[] {10, 6, 8, 7, 7, 8}, 5, 0),
                Arguments.of(new int[] {1, 6, 3, 1, 2, 5}, 20, 6),
                Arguments.of(new int[] {1, 3, 2, 4, 1}, 7, 4),
                Arguments.of(new int[] {1, 3, 2, 4, 1}, 10, 5),
                Arguments.of(new int[] {10, 6, 8, 7, 7, 8}, 5, 0),
                Arguments.of(new int[] {1, 6, 3, 1, 2, 5}, 20, 6),
                Arguments.of(new int[] {1, 6, 3, 1, 2, 5}, 18, 6),
                Arguments.of(new int[] {1, 6, 3, 1, 2, 5}, 17, 5),
                Arguments.of(new int[] {1}, 0, 0),
                Arguments.of(new int[] {1}, 1, 1),
                Arguments.of(new int[] {100000}, 99999, 0),
                Arguments.of(new int[] {100000}, 100000, 1),
                Arguments.of(new int[] {}, 100, 0),
                Arguments.of(new int[] {2, 2, 2, 2, 2}, 9, 4),
                Arguments.of(new int[] {2, 2, 2, 2, 2}, 10, 5),
                Arguments.of(new int[] {1, 1, 1, 1, 1}, 3, 3),
                Arguments.of(
                        new int[] {
                            // spotless:off
                            27,23,33,26,46,86,70,85,89,82,57,66,42,18,18,5,46,56,42,82,52,78,4,27,96,74,74,52,2,24,78,18,42,10,12,10,80,30,60,38,32,7,98,26,18,62,50,42,15,14,32,86,93,98,47,46,58,42,74,69,51,53,58,40,66,46,65,2,10,82,94,26,6,78,2,101,97,16,12,18,71,5,46,22,58,12,18,62,61,51,2,18,34,12,36,58,20,12,17,70}, 241, 24)
                            // spotless:on
                );
    }
}
