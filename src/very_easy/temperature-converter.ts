export const toCelsius = (temperature: number): number =>
    ((temperature - 32) * 5) / 9;
export const toFahrenheit = (temperature: number): number =>
    temperature * 1.8 + 32;
export const toKelvin = (temperature: number) => temperature + 273.15;
export const convertTemperature = (celsius: number): number[] => [
    toKelvin(celsius),
    toFahrenheit(celsius),
];

