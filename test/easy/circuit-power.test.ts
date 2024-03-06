import { describe, test, expect } from "bun:test";
import { circuitPower } from "~/easy/circuit-power";
describe("Circut Power Calculator", () => {
    test.each([
        [110, 3, 330],
        [230, 10, 2300],
        [480, 20, 9600],
    ])(
        "With a voltage of %d and a current of % the power will be %d",
        (voltage, current, output) => {
            const result = circuitPower(voltage, current);
            expect(result).toStrictEqual(output);
        },
    );
});
