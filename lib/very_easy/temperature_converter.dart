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

String temperatureConverter(String deg) {
  final buffer = StringBuffer();
  for (int i = 0; i < deg.length; i++) {
    final char = deg[i];
    final code = char.codeUnitAt(0);
    if ((code >= '0'.codeUnitAt(0) && code <= '9'.codeUnitAt(0)) || char == '-' || char == '.') {
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
