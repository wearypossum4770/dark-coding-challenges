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
#[cfg(test)]
mod tests {
    use super::{temperature_converter, to_celsius, to_fahrenheit, to_kelvin, tolerance, convert_temperature};
    use rstest::rstest;
    #[rstest]
		#[case("35°C", "95°F")]
		#[case("18°C", "64°F")]
		#[case("0°F", "-18°C")]
		#[case("100°C", "212°F")]
		#[case("69°F", "21°C")]
		#[case("159°C", "318°F")]
		#[case("-40°C", "-40°F")]
		#[case("-40°F", "-40°C")]
		#[case("16°C", "61°F")]
		#[case("500°C", "932°F")]
		#[case("33", "Error")]
		#[case("19°F", "-7°C")]
		#[case("85°C", "185°F")]
		#[case("0°C", "32°F")]
		#[case("1777°F", "969°C")]
		#[case("-90°C", "-130°F")]
		#[case("16°F", "-9°C")]
		#[case("180°C", "356°F")]
		#[case("7K", "Error")]
		#[case("100°F", "38°C")]
		fn test_temperature_converter(#[case] deg: &str, #[case] expected: &str) {
        assert_eq!(temperature_converter(deg.to_owned()), expected.to_owned());
    }
		#[rstest]
		#[case(68.0, 20.0)]
		#[case(18.0, -7.77778)]
		#[case(101.3, 38.5)]
		#[case(49.0, 9.444444)]
		#[case(-460.0, -273.33333)]
		#[case(-459.67, -273.15)]
		#[case(-148.00, -100.00)]
		#[case(-58.00, -50.00)]
		#[case(-40.00, -40.00)]
		#[case(14.00, -10.00)]
		#[case(32.00, 0.00)]
		#[case(77.00, 25.00)]
		#[case(97.70, 36.50)]
		#[case(122.00, 50.00)]
		#[case(167.00, 75.00)]
		#[case(212.00, 100.00)]
		#[case(302.00, 150.00)]
		#[case(392.00, 200.00)]
		fn test_to_celsius(#[case] fahrenheit: f64, #[case] expected: f64) {
			assert!((to_celsius(fahrenheit) - expected).abs() <= tolerance());
		}
		#[rstest]
		#[case(32.0, 89.6)]
		#[case(11.0, 51.8)]
		#[case(57.8, 136.04)]
		#[case(-89.2, -128.56)]
		#[case(280.0, 536.0)]
		#[case(-273.15, -459.67)]
		#[case(-100.00, -148.00)]
		#[case(-50.00, -58.00)]
		#[case(-40.00, -40.00)]
		#[case(-10.00, 14.00)]
		#[case(0.00, 32.00)]
		#[case(25.00, 77.00)]
		#[case(36.50, 97.70)]
		#[case(50.00, 122.00)]
		#[case(75.00, 167.00)]
		#[case(100.00, 212.00)]
		#[case(150.00, 302.00)]
		#[case(200.00, 392.00)]
		pub fn test_to_fahrenheit(#[case] celsius: f64, #[case] expected: f64) {
			assert!((to_fahrenheit(celsius) - expected).abs() <= tolerance());
		}
		#[rstest]
		#[case(-273.15, 0.00)]
		#[case(-100.00, 173.15)]
		#[case(-50.00, 223.15)]
		#[case(-40.00, 233.15)]
		#[case(-10.00, 263.15)]
		#[case(0.00, 273.15)]
		#[case(25.00, 298.15)]
		#[case(36.50, 309.65)]
		#[case(50.00, 323.15)]
		#[case(75.00, 348.15)]
		#[case(100.00, 373.15)]
		#[case(150.00, 423.15)]
		#[case(200.00, 473.15)]
		pub fn test_to_kelvin(#[case] celsius: f64, #[case] expected: f64) {
			assert!((to_kelvin(celsius) - expected).abs() <= tolerance());
		}
		#[rstest]
		#[case(36.50, &[309.65, 97.70])]
		#[case(0.00, &[273.15, 32.00])]
		#[case(100.00, &[373.15, 212.00])]
		#[case(25.75, &[298.90, 78.35])]
		#[case(10.20, &[283.35, 50.36])]
	pub fn test_convert_temperature(#[case] celsius: f64, #[case] expected: &[f64]) {
		convert_temperature(celsius).iter().enumerate().for_each(|(i, &actual)| {
			assert!((actual - expected[i]).abs() <= tolerance());
		});
	}
}
