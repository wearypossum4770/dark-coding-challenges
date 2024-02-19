import { describe, test, expect } from "bun:test";
import { spaceAge } from "~/easy/space-age";
describe("Determine Age on Different planets", () => {
    test.each([
        ["earth", 1000000000, 31.69],
        ["mercury", 2134835688, 280.88],
        ["venus", 189839836, 9.78],
        ["mars", 2129871239, 35.88],
        ["jupiter", 901876382, 2.41],
        ["saturn", 2000000000, 2.15],
        ["uranus", 1210123456, 0.46],
        ["neptune", 1821023456, 0.35],
    ])(
        "On the planet %s with an age of %s you would have aged %s years",
        async (planet, seconds, years) => {
            const result = spaceAge(planet, seconds);
            expect(result).toStrictEqual(years);
        },
    );
});
