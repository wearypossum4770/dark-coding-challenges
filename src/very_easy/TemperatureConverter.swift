func toCelsius(_ fahrenheit: Double) -> Double {
  return (fahrenheit - 32) * 5 / 9
}
func toKelvin(_ celsius: Double) -> Double {
  return celsius + 273.15
}
func toFahrenheit(_ celsius: Double) -> Double {
  return celsius * 1.8 + 32
}

func convertTemperature(_ celsius: Double) -> [Double] {
  return [
    toKelvin(celsius),
    toFahrenheit(celsius),
  ]
}
