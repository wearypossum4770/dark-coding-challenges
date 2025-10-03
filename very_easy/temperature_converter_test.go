package very_easy

import (
	"testing"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func TestTemperatureConverter(t *testing.T) {
	cases := []struct {
		deg      string
		expected string
	}{
		{"35°C", "95°F"},
		{"18°C", "64°F"},
		{"0°F", "-18°C"},
		{"100°C", "212°F"},
		{"69°F", "21°C"},
		{"159°C", "318°F"},
		{"-40°C", "-40°F"},
		{"-40°F", "-40°C"},
		{"16°C", "61°F"},
		{"500°C", "932°F"},
		{"33", "Error"},
		{"19°F", "-7°C"},
		{"85°C", "185°F"},
		{"0°C", "32°F"},
		{"1777°F", "969°C"},
		{"-90°C", "-130°F"},
		{"16°F", "-9°C"},
		{"180°C", "356°F"},
		{"7K", "Error"},
		{"100°F", "38°C"},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := TemperatureConverter(c.deg)
			if result != c.expected {
				t.Errorf("TemperatureConverter(%v) == %v, expected %v", c.deg, result, c.expected)
			}

		})

	}
}

func TestToKelvin(t *testing.T) {
	cases := []struct {
		temp     float64
		expected float64
	}{
		{-273.15, 0.00},
		{-100.00, 173.15},
		{-50.00, 223.15},
		{-40.00, 233.15},
		{-10.00, 263.15},
		{0.00, 273.15},
		{25.00, 298.15},
		{36.50, 309.65},
		{50.00, 323.15},
		{75.00, 348.15},
		{100.00, 373.15},
		{150.00, 423.15},
		{200.00, 473.15},
	}
	for i, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ToKelvin(c.temp)
			if !core.AlmostEqual(result, c.expected, 1e-5) {
				t.Errorf("Test Case %d - ToKelvin(%v) == %v, expected %v", i, c.temp, result, c.expected)
			}
		})
	}
}
func TestToFahrenheit(t *testing.T) {
	cases := []struct {
		temp     float64
		expected float64
	}{
		{32.0, 89.6},
		{11.0, 51.8},
		{57.8, 136.04},
		{-89.2, -128.56},
		{280.0, 536.0},
		{-273.15, -459.67},
		{-100.00, -148.00},
		{-50.00, -58.00},
		{-40.00, -40.00},
		{-10.00, 14.00},
		{0.00, 32.00},
		{25.00, 77.00},
		{36.50, 97.70},
		{50.00, 122.00},
		{75.00, 167.00},
		{100.00, 212.00},
		{150.00, 302.00},
		{200.00, 392.00},
	}
	for i, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ToFahrenheit(c.temp)
			if !core.AlmostEqual(result, c.expected, 1e-5) {
				t.Errorf("Test Case %d - ToFahrenheit(%v) == %v, expected %v", i, c.temp, result, c.expected)
			}
		})
	}
}
func TestToCelsius(t *testing.T) {
	cases := []struct {
		temp     float64
		expected float64
	}{
		{68.0, 20.0},
		{18.0, -7.78},
		{101.3, 38.5},
		{49.0, 9.444},
		{-460.0, -273.33},
		{-459.67, -273.15},
		{-148.00, -100.00},
		{-58.00, -50.00},
		{-40.00, -40.00},
		{14.00, -10.00},
		{32.00, 0.00},
		{77.00, 25.00},
		{97.70, 36.50},
		{122.00, 50.00},
		{167.00, 75.00},
		{212.00, 100.00},
		{302.00, 150.00},
		{392.00, 200.00},
	}
	for i, c := range cases {
		t.Run("", func(t *testing.T) {
			result := core.RoundTo2Decimals(ToCelsius(c.temp))
			expected := core.RoundTo2Decimals(c.expected)
			if result != expected {
				t.Errorf("Test Case %d - ToCelsius(%v) == %v, expected %v", i, c.temp, result, c.expected)
			}
		})
	}
}
func TestConvertTemperature(t *testing.T) {
	tolerance := 0.001
	cases := []struct {
		temp     float64
		expected []float64
	}{
		{36.50, []float64{309.65, 97.70}},
		{0.00, []float64{273.15, 32.00}},
		{100.00, []float64{373.15, 212.00}},
		{25.75, []float64{298.90, 78.35}},
		{10.20, []float64{283.35, 50.36}},
	}
	for i, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ConvertTemperature(c.temp)
			if core.FloatSlicesEqual(result, c.expected, tolerance) {
				t.Errorf("Test Case %d -  ConvertTemperature(%v) == %v, expected %v", i, c.temp, result, c.expected)
			}
		})
	}
}
