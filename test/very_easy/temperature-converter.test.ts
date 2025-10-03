import { describe, test, expect } from "bun:test";
import {
    temperatureConverter,
    convertTemperature,
    toFahrenheit,
    toCelsius,
    toKelvin,
} from "@/src/very_easy/temperature-converter";

const tolerance = 10e-5;
describe("temperatureConverter", () => {
    test.each([
        ["35°C", "95°F"],
        ["18°C", "64°F"],
        ["0°F", "-18°C"],
        ["100°C", "212°F"],
        ["69°F", "21°C"],
        ["159°C", "318°F"],
        ["-40°C", "-40°F"],
        ["-40°F", "-40°C"],
        ["16°C", "61°F"],
        ["500°C", "932°F"],
        ["33", "Error"],
        ["19°F", "-7°C"],
        ["85°C", "185°F"],
        ["0°C", "32°F"],
        ["1777°F", "969°C"],
        ["-90°C", "-130°F"],
        ["16°F", "-9°C"],
        ["180°C", "356°F"],
        ["7K", "Error"],
        ["100°F", "38°C"],
    ])(
        "\n\tGiven: the temperature %s.\n\tThen: after conversion it is %s",
        (inputs: string, output: string) => {
            const result = temperatureConverter(inputs);
            expect(result).toStrictEqual(output);
        },
    );
    test.each([
        [36.5, [309.65, 97.7]],
        [122.11, [395.26, 251.798]],
    ])(
        "\n\tGiven: the temperature in celsius: $p.\n\tThen: in [kelvin, fahrenheit] it is %p",
        (celsius: number, expected: number[]) => {
            const result = convertTemperature(celsius);
            result.forEach((actual, index) =>
                expect(actual).toBeCloseTo(expected[index], tolerance),
            );
        },
    );

    test.each([
        [-273.15, 0.0],
        [-100.0, 173.15],
        [-50.0, 223.15],
        [-40.0, 233.15],
        [-10.0, 263.15],
        [0.0, 273.15],
        [25.0, 298.15],
        [36.5, 309.65],
        [50.0, 323.15],
        [75.0, 348.15],
        [100.0, 373.15],
        [150.0, 423.15],
        [200.0, 473.15],
    ])(
        "\n\tGiven: the temperature %p.\n\tWhen: it is converted into kelvin.\n\tThen: it will be %p",
        (temperature: number, expected: number) => {
            const actual = toKelvin(temperature);
            expect(actual).toBeCloseTo(expected);
        },
    );

    test.each([
        [32.0, 89.6],
        [11.0, 51.8],
        [57.8, 136.04],
        [-89.2, -128.56],
        [280.0, 536.0],
        [-273.15, -459.67],
        [-100.0, -148.0],
        [-50.0, -58.0],
        [-40.0, -40.0],
        [-10.0, 14.0],
        [0.0, 32.0],
        [25.0, 77.0],
        [36.5, 97.7],
        [50.0, 122.0],
        [75.0, 167.0],
        [100.0, 212.0],
        [150.0, 302.0],
        [200.0, 392.0],
    ])(
        "\n\tGiven: the temperature %p.\n\tWhen: it is converted into fahrenheit.\n\tThen: it will be %p",
        (temperature: number, expected: number) => {
            const actual = toFahrenheit(temperature);
            expect(actual).toBeCloseTo(expected);
        },
    );

    test.each([
        [68.0, 20.0],
        [18.0, -7.77778],
        [101.3, 38.5],
        [49.0, 9.44444],
        [-460.0, -273.33333],
        [-459.67, -273.15],
        [-148.0, -100.0],
        [-58.0, -50.0],
        [-40.0, -40.0],
        [14.0, -10.0],
        [32.0, 0.0],
        [77.0, 25.0],
        [97.7, 36.5],
        [122.0, 50.0],
        [167.0, 75.0],
        [212.0, 100.0],
        [302.0, 150.0],
        [392.0, 200.0],
    ])(
        "\n\tGiven: the temperature %p.\n\tWhen: it is converted into celsius.\n\tThen: it will be %p",
        (temperature: number, expected: number) => {
            const actual = toCelsius(temperature);
            expect(actual).toBeCloseTo(expected);
        },
    );
});
