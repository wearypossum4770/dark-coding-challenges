package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

public class RomanToIntTest {

  @ParameterizedTest
  @CsvSource({
    "'IV', 4",
    "'XC', 90",
    "'CM', 900",
    "'MMM', 3_000",
    "'III', 3",
    "'XXVII', 27",
    "'LVIII', 58",
    "'MCMXCIV', 1_994",
    "'MMMCMXCIV', 3_994",
    "'I', 1",
    "'VIII', 8",
    "'XXIX', 29",
    "'LIV', 54",
    "'CCV', 205",
    "'CDXLIV', 444",
    "'CMXCIX', 999",
    "'M', 1_000",
    "'MMMDCCCLXXXVIII', 3_888",
    "'MMMCMX', 3_910",
  })
  public void testRomanToInt(String roman, int arabic) {
    RomanToInt converter = new RomanToInt();
    int result = converter.solve(roman);
    assertEquals(arabic, result);
  }
}
