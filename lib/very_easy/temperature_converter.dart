double toCelsius(double fahrenheit) {
	return (fahrenheit -32) * 5 / 9;
	}
double toFahrenheit(double celsius) {
	return (celsius  * 1.8) + 32;
	}
double toKelvin(double celsius) {
	return celsius + 273.15;
	}

List<double> convertTemperature(double celsius) {
	return [
		toKelvin(celsius),
		toFahrenheit(celsius),
	];
}
