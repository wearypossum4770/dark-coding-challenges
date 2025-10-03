package veryeasy
import kotlin.math.roundToInt

fun kodeeToCelsius(temperature: Double): Double = (temperature - 32.0) * 5.0 / 9.0

fun kodeeToFahrenheit(temperature: Double): Double = (temperature * 1.8) + 32.0

fun kodeeToKelvin(temperature: Double): Double = temperature + 273.15

fun kodeeConvertTemperature(celsius: Double): DoubleArray = doubleArrayOf(kodeeToKelvin(celsius), kodeeToFahrenheit(celsius))
