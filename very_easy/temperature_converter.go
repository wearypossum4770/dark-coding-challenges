package very_easy

import (
	"fmt"
	"math"
	"strconv"
	"strings"
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
func TemperatureConverter(deg string) string {
	var sb strings.Builder
	for _, c := range deg {
		if (c >= '0' && c <= '9') || c == '-' {
			sb.WriteRune(c)
		}
	}
	temp, err := strconv.Atoi(sb.String())
	if err != nil {
		return "Error"
	}
	if strings.HasSuffix(deg, "°C") {
		return fmt.Sprintf("%d°F", int(math.Round(ToFahrenheit(float64(temp)))))
	}
	if strings.HasSuffix(deg, "°F") {
		return fmt.Sprintf("%d°C", int(math.Round(ToCelsius(float64(temp)))))

	}

	return "Error"
}
func ConvertTemperature(celsius float64) []float64 {
	return []float64{
		math.Round(ToKelvin(celsius)),
		math.Round(ToFahrenheit(celsius)),
	}
}
