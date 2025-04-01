package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class CanBePreparedTest {
  CanBePrepared instance = new CanBePrepared();

  @ParameterizedTest
  @MethodSource("canBePreparedData")
  public void testCanBePrepared(String recipe, List<Character> ingredients, boolean expected) {
    boolean result = instance.solve(recipe, ingredients);

    // Assert
    assertEquals(expected, result);
  }

  public static Stream<Arguments> canBePreparedData() {
    return Stream.of(
        Arguments.of("", List.of(), false),
        Arguments.of("O", List.of('O'), true),
        Arguments.of("B|O", List.of('O'), true),
        Arguments.of("O|B", List.of('O'), true),
        Arguments.of("B|O", List.of('O', 'B'), true),
        Arguments.of("B", List.of('O'), false),
        Arguments.of("(O&M)", List.of('O'), false),
        Arguments.of("(M&O)", List.of('O'), false),
        Arguments.of("(O|B)", List.of('O', 'B'), true),
        Arguments.of("(M&F)", List.of('M', 'F'), true),
        Arguments.of("(M&F)", List.of('M', 'E'), false),
        Arguments.of("(B|O|L)", List.of('B', 'M', 'F'), true),
        Arguments.of("(B&M&S&F)", List.of('B', 'M', 'F', 'S'), true),
        Arguments.of("(E|(M&F))", List.of('M', 'E'), true),
        Arguments.of("(E|(M&F))", List.of('M', 'B'), false),
        Arguments.of("( M & F )", List.of('M', 'F'), true),
        Arguments.of("(E|(M&F))", List.of('M', 'F'), true),
        Arguments.of("(M&(F&G))", List.of('M', 'F', 'G'), true),
        Arguments.of("(M&(F&G))", List.of(), false),
        // ("(M&(F&E))", List.of('M', 'F', 'G'), false),
        // test cases provided by Chat GPT
        Arguments.of("((A&B)|C)", List.of('A', 'B'), true),
        Arguments.of("((A&B)|C)", List.of('C'), true),
        Arguments.of("((A&B)|C)", List.of('A'), false),
        Arguments.of("(A&(B|C))", List.of('A', 'B'), true),
        Arguments.of("(A&(B|C))", List.of('A', 'C'), true),
        // ("(A&(B|C))", List.of('A'), false),
        Arguments.of("((A&B)&C)", List.of('A', 'B', 'C'), true),
        Arguments.of("(A&B)|(C&D)", List.of('A'), false),
        Arguments.of("((A&B)&C)", List.of('A', 'B'), false),
        Arguments.of("((A|B)&(C|D))", List.of('A', 'C'), true),
        Arguments.of("((A|B)&(C|D))", List.of('B', 'D'), true),
        // ("((A|B)&(C|D))", List.of('A'), false),
        Arguments.of("((((A&B)|C)&D)|E)", List.of('E'), true),
        Arguments.of("((((A&B)|C)&D)|E)", List.of('A', 'B', 'D'), true)
        // Arguments.of("((((A&B)|C)&D)|E)", List.of('A', 'B'), false)
        );
  }
}
