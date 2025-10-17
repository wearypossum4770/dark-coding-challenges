package veryeasy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.math.abs
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertTrue

val tolerance = 1e-5

class KodeeTemperatureConverterTest {
    @ParameterizedTest
    @MethodSource("temperatureControlData")
    fun kodeeTemperatureConverterTest(
        deg: String,
        expected: String,
    ) {
        val result = kodeeTemperatureConverter(deg)
        assertEquals(expected, result)
    }

    @ParameterizedTest
    @MethodSource("convertTemperatureData")
    fun kodeeConvertTemperatureTest(
        celsius: Double,
        expected: DoubleArray,
    ) {
        val result = kodeeConvertTemperature(celsius)
        assertContentEquals(result, expected)
    }

    @ParameterizedTest
    @MethodSource("toFahrenheitData")
    fun kodeeToFahrenheit(
        celsius: Double,
        expected: Double,
    ) {
        val actual = kodeeToFahrenheit(celsius)
        assertTrue(
            abs(expected - actual) <= tolerance,
            "Expected $actual to be within $tolerance of $expected",
        )
    }

    @ParameterizedTest
    @MethodSource("toCelsiusData")
    fun kodeeToCelsiusTest(
        fahrenheit: Double,
        expected: Double,
    ) {
        val actual = kodeeToCelsius(fahrenheit)
        assertTrue(
            abs(expected - actual) <= tolerance,
            "Expected $actual to be within $tolerance of $expected",
        )
    }

    @ParameterizedTest
    @MethodSource("toKelvinData")
    fun kodeeToKelvinTest(
        celsius: Double,
        expected: Double,
    ) {
        val actual = kodeeToKelvin(celsius)
        assertTrue(
            abs(expected - actual) <= tolerance,
            "Expected $actual to be within $tolerance of $expected",
        )
    }

    companion object {
        @JvmStatic
        fun convertTemperatureData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(36.50, doubleArrayOf(309.65000, 97.70000)),
                Arguments.of(122.11, doubleArrayOf(395.26000, 251.79800)),
            )

        @JvmStatic
        fun toKelvinData(): Stream<Arguments> =
            Stream.of(
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
                Arguments.of(200.00, 473.15),
            )

        @JvmStatic
        fun toFahrenheitData(): Stream<Arguments> =
            Stream.of(
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
                Arguments.of(200.00, 392.00),
            )

        @JvmStatic
        fun toCelsiusData(): Stream<Arguments> =
            Stream.of(
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
                Arguments.of(392.00, 200.00),
            )

        @JvmStatic
        fun temperatureControlData(): Stream<Arguments> =
            Stream.of(
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
                Arguments.of("100°F", "38°C"),
            )
    }
}
