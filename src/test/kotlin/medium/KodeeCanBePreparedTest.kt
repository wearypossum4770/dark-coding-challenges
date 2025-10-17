package medium

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeCanBePreparedTest {
    @ParameterizedTest
    @MethodSource("canBePreparedData")
    fun kodeeCanBePreparedTest(
        recipeToCheck: String,
        ingredientsToCheck: List<Char>,
        expected: Boolean,
    ) {
        val result = kodeeCanBePrepared(recipeToCheck, ingredientsToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun canBePreparedData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("", listOf<Char>(), false),
                Arguments.of("O", listOf('O'), true),
                Arguments.of("B|O", listOf('O'), true),
                Arguments.of("O|B", listOf('O'), true),
                Arguments.of("B|O", listOf('O', 'B'), true),
                Arguments.of("B", listOf('O'), false),
                Arguments.of("(O&M)", listOf('O'), false),
                Arguments.of("(M&O)", listOf('O'), false),
                Arguments.of("(O|B)", listOf('O', 'B'), true),
                Arguments.of("(M&F)", listOf('M', 'F'), true),
                Arguments.of("(M&F)", listOf('M', 'E'), false),
                Arguments.of("(B|O|L)", listOf('B', 'M', 'F'), true),
                Arguments.of("(B&M&S&F)", listOf('B', 'M', 'F', 'S'), true),
                Arguments.of("(E|(M&F))", listOf('M', 'E'), true),
                Arguments.of("(E|(M&F))", listOf('M', 'B'), false),
                Arguments.of("( M & F )", listOf('M', 'F'), true),
                Arguments.of("(E|(M&F))", listOf('M', 'F'), true),
                Arguments.of("(M&(F&G))", listOf('M', 'F', 'G'), true),
                Arguments.of("(M&(F&G))", listOf<Char>(), false),
                // Arguments.of  ("(M&(F&E))", listOf('M', 'F', 'G'), false),
                // // test cases provided by Chat GPT
                Arguments.of("((A&B)|C)", listOf('A', 'B'), true),
                Arguments.of("((A&B)|C)", listOf('C'), true),
                Arguments.of("((A&B)|C)", listOf('A'), false),
                Arguments.of("(A&(B|C))", listOf('A', 'B'), true),
                Arguments.of("(A&(B|C))", listOf('A', 'C'), true),
                // Arguments.of ("(A&(B|C))", listOf('A'), false),
                Arguments.of("((A&B)&C)", listOf('A', 'B', 'C'), true),
                Arguments.of("(A&B)|(C&D)", listOf('A'), false),
                Arguments.of("((A&B)&C)", listOf('A', 'B'), false),
                Arguments.of("((A|B)&(C|D))", listOf('A', 'C'), true),
                Arguments.of("((A|B)&(C|D))", listOf('B', 'D'), true),
                // Arguments.of ("((A|B)&(C|D))", listOf('A'), false),
                Arguments.of("((((A&B)|C)&D)|E)", listOf('E'), true),
                Arguments.of("((((A&B)|C)&D)|E)", listOf('A', 'B', 'D'), true),
                // Arguments.of ("((((A&B)|C)&D)|E)", listOf('A', 'B'), false),
            )
    }
}
