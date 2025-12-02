package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class DayOfTheWeekTest {
  DayOfTheWeek instance = new DayOfTheWeek();

  @ParameterizedTest
  @MethodSource("dataDayOfTheWeek")
  public void testDayOfTheWeek(int day, int month, int year, String expected) {

    String result = instance.solve(day, month, year);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataDayOfTheWeek() {
    return Stream.of(
        Arguments.of(31, 8, 2019, "Saturday"),
        Arguments.of(18, 7, 1999, "Sunday"),
        Arguments.of(15, 8, 1993, "Sunday"),
        Arguments.of(29, 2, 2016, "Monday"),
        Arguments.of(1, 1, 1971, "Friday"),
        Arguments.of(31, 12, 1971, "Friday"),
        Arguments.of(1, 1, 2100, "Friday"),
        Arguments.of(31, 12, 2100, "Friday"),
        Arguments.of(29, 2, 1972, "Tuesday"),
        Arguments.of(29, 2, 2000, "Tuesday"),
        Arguments.of(1, 3, 2100, "Monday"),
        Arguments.of(1, 3, 2020, "Sunday"),
        Arguments.of(31, 3, 2020, "Tuesday"),
        Arguments.of(28, 2, 2019, "Thursday"),
        Arguments.of(1, 3, 2019, "Friday"),
        Arguments.of(29, 2, 2020, "Saturday"),
        Arguments.of(1, 3, 2020, "Sunday"),
        Arguments.of(4, 7, 1976, "Sunday"),
        Arguments.of(1, 1, 2000, "Saturday"),
        Arguments.of(11, 9, 2001, "Tuesday"),
        Arguments.of(30, 12, 1999, "Thursday"),
        Arguments.of(31, 12, 1999, "Friday"),
        Arguments.of(1, 1, 2000, "Saturday"),
        Arguments.of(30, 4, 2021, "Friday"),
        Arguments.of(1, 5, 2021, "Saturday"),
        Arguments.of(2, 5, 2021, "Sunday"),
        Arguments.of(10, 10, 2010, "Sunday"),
        Arguments.of(14, 2, 2023, "Tuesday"),
        Arguments.of(25, 12, 1995, "Monday"));
  }
}
