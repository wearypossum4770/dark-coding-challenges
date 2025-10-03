pub fn tolerance() -> f64 {
	1e-5
}
pub fn to_fahrenheit(celsius: f64) -> f64 {
	(celsius * 1.8) + 32.0
}
pub fn to_kelvin(celsius: f64) -> f64 {
	celsius + 273.15
}
pub fn to_celsius(fahrenheit: f64) -> f64 {
	(fahrenheit - 32.0) *( 5.0 / 9.0)
}

pub fn convert_temperature(celsius: f64) -> Vec<f64> {
	Vec::from([
		to_kelvin(celsius),
		to_fahrenheit(celsius),
	])
}
