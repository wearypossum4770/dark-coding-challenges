export const toCelsius = (temperature: number): number =>
    ((temperature - 32) * 5) / 9;
export const toFahrenheit = (temperature: number): number =>
    temperature * 1.8 + 32;
export const toKelvin = (temperature: number) => temperature + 273.15;
export const convertTemperature = (celsius: number): number[] => [
    toKelvin(celsius),
    toFahrenheit(celsius),
];

export const temperatureConverter = (deg: string): string => {
    let temp = "";
    for (const char of deg) {
        if (/[0-9.]/.test(char) || char === "-") {
            temp += char;
        }
    }
    const temperature = Number(temp);
    if (deg.endsWith("°F")) return `${Math.round(toCelsius(temperature))}°C`;
    if (deg.endsWith("°C")) return `${Math.round(toFahrenheit(temperature))}°F`;
    return "Error";
};
