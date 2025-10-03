package very_easy

import (
	"math"
)

func ToKelvin(celsius float64) float64 {
	return celsius + 273.15
}
func ToFahrenheit(celsius float64) float64 {
	return (celsius * 1.8) + 32.0
}
func ToCelsius(fahrenheit float64) float64 {
	return (fahrenheit - 32.0) * 5 / 9
}

func ConvertTemperature(celsius float64) []float64 {
	return []float64{
		math.Round(ToKelvin(celsius)),
		math.Round(ToFahrenheit(celsius)),
	}
}
