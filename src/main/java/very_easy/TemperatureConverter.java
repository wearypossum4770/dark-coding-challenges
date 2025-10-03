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

}
