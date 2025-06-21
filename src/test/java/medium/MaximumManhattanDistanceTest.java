
package medium;
import java.util.stream.Stream;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MaximumManhattanDistanceTest {
MaximumManhattanDistance instance = new MaximumManhattanDistance();
@ParameterizedTest
@MethodSource("dataMaximumManhattanDistance")
public void testMaximumManhattanDistance(int[] nums, boolean expected) {

boolean result = instance.solve(nums);

assertEquals(expected, result);
}
public static Stream<Arguments> dataMaximumManhattanDistance(){
	return Stream.of();
}
}