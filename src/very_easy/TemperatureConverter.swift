func toCelsius(_ fahrenheit: Double) -> Double {
  return (fahrenheit - 32) * 5 / 9
}
func toKelvin(_ celsius: Double) -> Double {
  return celsius + 273.15
}
func toFahrenheit(_ celsius: Double) -> Double {
  return celsius * 1.8 + 32
}

func temperatureConverter(_ deg: String) -> String {
  var temp = ""
  for ch in deg {
    switch ch {
      case "0"..."9", "-", ".":
        temp.append(ch)
      default:
        break
    }
  }
  guard let temperature = Double(temp) else {
    return "Error"
  }
  if deg.hasSuffix("°F") {
    return String(format: "%.0f°C", toCelsius(temperature))
  } else if deg.hasSuffix("°C") {

    return String(format: "%.0f°F", toFahrenheit(temperature))
  }
  return "Error"
}

func convertTemperature(_ celsius: Double) -> [Double] {
  return [
    toKelvin(celsius),
    toFahrenheit(celsius),
  ]
}
