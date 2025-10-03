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

    public function solve(string $temperature): string
    {
        return $this->transformTemperatureConverter($temperature);
    }
}
