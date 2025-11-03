double toCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

double toFahrenheit(double celsius) {
  return (celsius * 1.8) + 32;
}

double toKelvin(double celsius) {
  return celsius + 273.15;
}

List<double> convertTemperature(double celsius) {
  return [toKelvin(celsius), toFahrenheit(celsius)];
}

bool isDigit(int char) {
  return char >= 48 && char <= 57;
}

bool isTemperatureChar(String char) {
  switch (char) {
    case '-':
    case '.':
      return true;
    default:
      return false;
  }
}

String temperatureConverter(String deg) {
  final buffer = StringBuffer();
  for (int i = 0; i < deg.length; i++) {
    if (isDigit(deg.codeUnitAt(i)) || isTemperatureChar(deg[i])) {
      buffer.write(deg[i]);
    } else {
      break;
    }
  }
  double temp = double.parse(buffer.toString());
  if (deg.endsWith("°C")) {
    double temperature = toFahrenheit(temp);
    return "${temperature.round()}°F";
  }

  if (deg.endsWith("°F")) {
    double temperature = toCelsius(temp);
    return "${temperature.round()}°C";
  }
  return "Error";
}
