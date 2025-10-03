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
pub fn temperature_converter(deg: String) -> String {
  let temperature = deg.chars().filter(|&t| t.is_ascii_digit() || t == '.' || t == '-').collect::<String>().parse::<f64>().unwrap_or(0.0);
	if deg.ends_with("°C") {
		return format!("{}°F", to_fahrenheit(temperature).round() as i32);
	}
	else if deg.ends_with("°F") {
		return format!("{}°C", to_celsius(temperature).round() as i32);
		}else {
			return "Error".to_string();
		}

}

pub fn convert_temperature(celsius: f64) -> Vec<f64> {
	Vec::from([
		to_kelvin(celsius),
		to_fahrenheit(celsius),
	])
}
