package very_easy;

public class TemperatureConverter {
  public double[] convertTemperature(Double celsius) {
    return new double[] {
      toKelvin(celsius), toFahrenheit(celsius),
    };
  }

  public double toCelsius(double fahrenheit) {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
  }

  public double toFahrenheit(double celsius) {
    return (celsius * 1.8) + 32.0;
  }

  public double toKelvin(double celsius) {
    return celsius + 273.15;
  }

  public String solve(String deg) {
    StringBuilder result = new StringBuilder();
    for (char c : deg.toCharArray()) {
      if (c >= '0' && c <= '9' || c == '-' || c == '.') {
        result.append(c);
      }
    }
    double temperature = Double.parseDouble(result.toString());
    if (deg.endsWith("°F")) return String.format("%d°C", (int) Math.round(toCelsius(temperature)));
    if (deg.endsWith("°C"))
      return String.format("%d°F", (int) Math.round(toFahrenheit(temperature)));
    return "Error";
  }
}
