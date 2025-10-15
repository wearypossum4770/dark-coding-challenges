<?php

declare(strict_types=1);

namespace Src\VeryEasy;

class TemperatureConverter
{
    public function convertTemperature(float $celsius): array
    {
        return [
            $this->toKelvin($celsius),
            $this->toFahrenheit($celsius),
        ];
    }

    public function toCelsius(float $fahrenheit): float
    {
        return ($fahrenheit - 32) * 5.0 / 9.0;
    }

    public function toFahrenheit(float $celsius): float
    {
        return ($celsius * 1.8) + 32;
    }

    public function toKelvin(float $celsius): float
    {
        return $celsius + 273.15;
    }

    public function transformTemperatureConverter(string $deg): string
    {
        $temp = preg_replace('/[^0-9\.\-]/', '', $deg);
        if ($temp === '' || ! is_numeric($temp)) {
            return 'Error';
        }
        $temperature = (float) $temp;

        if (str_ends_with($deg, '°F')) {
            return sprintf('%.0f°C', self::toCelsius($temperature));
        }

        if (str_ends_with($deg, '°C')) {
            return sprintf('%.0f°F', self::toFahrenheit($temperature));
        }

        return 'Error';
    }

    public function solve(string $temperature): string
    {
        return $this->transformTemperatureConverter($temperature);
    }
}
