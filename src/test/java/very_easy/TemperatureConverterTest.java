package very_easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class TemperatureConverterTest {
  TemperatureConverter instance = new TemperatureConverter();
  public final double tolerance = 1e-5;

  @ParameterizedTest
  @MethodSource("temperatureControlData")
  public void testTemperatureConverter(String deg, String expected) {

    String result = instance.solve(deg);

    assertEquals(expected, result);
  }

  @ParameterizedTest
  @MethodSource("convertTemperatureData")
  public void testConvertTemperature(double celsius, double[] expected) {
    double[] actual = instance.convertTemperature(celsius);
    assertArrayEquals(expected, actual);
  }

  @ParameterizedTest
  @MethodSource("toCelsiusData")
  public void testToCelsius(double fahrenheit, double expected) {
    double actual = instance.toCelsius(fahrenheit);
    assertEquals(expected, actual, tolerance);
  }

  @ParameterizedTest
  @MethodSource("toFahrenheitData")
  public void toFahrenheitTest(double celsius, double expected) {
    double actual = instance.toFahrenheit(celsius);
    assertEquals(expected, actual, tolerance);
  }

  @ParameterizedTest
  @MethodSource("toKelvinData")
  public void toKelvinTest(double celsius, double expected) {
    double actual = instance.toKelvin(celsius);
    assertEquals(expected, actual, tolerance);
  }

  public static Stream<Arguments> convertTemperatureData() {
    return Stream.of(
        Arguments.of(36.50, new double[] {309.65000, 97.70000}),
        Arguments.of(122.11, new double[] {395.26000, 251.79800}));
  }

  public static Stream<Arguments> toKelvinData() {
    return Stream.of(
        Arguments.of(-273.15, 0.00),
        Arguments.of(-100.00, 173.15),
        Arguments.of(-50.00, 223.15),
        Arguments.of(-40.00, 233.15),
        Arguments.of(-10.00, 263.15),
        Arguments.of(0.00, 273.15),
        Arguments.of(25.00, 298.15),
        Arguments.of(36.50, 309.65),
        Arguments.of(50.00, 323.15),
        Arguments.of(75.00, 348.15),
        Arguments.of(100.00, 373.15),
        Arguments.of(150.00, 423.15),
        Arguments.of(200.00, 473.15));
  }

  public static Stream<Arguments> toFahrenheitData() {
    return Stream.of(
        Arguments.of(32.0, 89.6),
        Arguments.of(11.0, 51.8),
        Arguments.of(57.8, 136.04),
        Arguments.of(-89.2, -128.56),
        Arguments.of(280.0, 536.0),
        Arguments.of(-273.15, -459.67),
        Arguments.of(-100.00, -148.00),
        Arguments.of(-50.00, -58.00),
        Arguments.of(-40.00, -40.00),
        Arguments.of(-10.00, 14.00),
        Arguments.of(0.00, 32.00),
        Arguments.of(25.00, 77.00),
        Arguments.of(36.50, 97.70),
        Arguments.of(50.00, 122.00),
        Arguments.of(75.00, 167.00),
        Arguments.of(100.00, 212.00),
        Arguments.of(150.00, 302.00),
        Arguments.of(200.00, 392.00));
  }

  public static Stream<Arguments> toCelsiusData() {
    return Stream.of(
        Arguments.of(68.0, 20.0),
        Arguments.of(18.0, -7.77778),
        Arguments.of(101.3, 38.5),
        Arguments.of(49.0, 9.44444),
        Arguments.of(-460.0, -273.33333),
        Arguments.of(-459.67, -273.15),
        Arguments.of(-148.00, -100.00),
        Arguments.of(-58.00, -50.00),
        Arguments.of(-40.00, -40.00),
        Arguments.of(14.00, -10.00),
        Arguments.of(32.00, 0.00),
        Arguments.of(77.00, 25.00),
        Arguments.of(97.70, 36.50),
        Arguments.of(122.00, 50.00),
        Arguments.of(167.00, 75.00),
        Arguments.of(212.00, 100.00),
        Arguments.of(302.00, 150.00),
        Arguments.of(392.00, 200.00));
  }

  public static Stream<Arguments> temperatureControlData() {
    return Stream.of(
        Arguments.of("35°C", "95°F"),
        Arguments.of("18°C", "64°F"),
        Arguments.of("0°F", "-18°C"),
        Arguments.of("100°C", "212°F"),
        Arguments.of("69°F", "21°C"),
        Arguments.of("159°C", "318°F"),
        Arguments.of("-40°C", "-40°F"),
        Arguments.of("-40°F", "-40°C"),
        Arguments.of("16°C", "61°F"),
        Arguments.of("500°C", "932°F"),
        Arguments.of("33", "Error"),
        Arguments.of("19°F", "-7°C"),
        Arguments.of("85°C", "185°F"),
        Arguments.of("0°C", "32°F"),
        Arguments.of("1777°F", "969°C"),
        Arguments.of("-90°C", "-130°F"),
        Arguments.of("16°F", "-9°C"),
        Arguments.of("180°C", "356°F"),
        Arguments.of("7K", "Error"),
        Arguments.of("100°F", "38°C"));
  }
}
