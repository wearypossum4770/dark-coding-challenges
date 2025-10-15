package veryeasy
import kotlin.math.roundToInt

fun kodeeToCelsius(temperature: Double): Double = (temperature - 32.0) * 5.0 / 9.0

fun kodeeToFahrenheit(temperature: Double): Double = (temperature * 1.8) + 32.0

fun kodeeToKelvin(temperature: Double): Double = temperature + 273.15

fun kodeeTemperatureConverter(deg: String): String {
    val temp =
        buildString {
            for (i in deg) {
                if (i in '0'..'9' || i == '-' || i == '.') {
                    append(i)
                } else {
                    break
                }
            }
        }.toDoubleOrNull() ?: return "Error"

    return when {
        deg.endsWith("°F") -> "${kodeeToCelsius(temp).roundToInt().toInt()}°C"
        deg.endsWith("°C") -> "${kodeeToFahrenheit(temp).roundToInt().toInt()}°F"
        else -> "Error"
    }
}

fun kodeeConvertTemperature(celsius: Double): DoubleArray = doubleArrayOf(kodeeToKelvin(celsius), kodeeToFahrenheit(celsius))
