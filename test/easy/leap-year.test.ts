import { describe, test, expect } from "bun:test";
import { leapYear } from "~/easy/leap-year";
describe("Check if a given year is a leap year.", () => {
    test.each([
        [1850, false],
        [1565, false],
        [1920, true],
        [1924, true],
        [1928, true],
        [1940, true],
        [2021, false],
        [2004, true],
        [8, true],
        [4, true],
        [2019, false],
        [1970, false],
        [1934, false],
        [1874, false],
        [1968, true],
    ])("the year %s passes leap year %o", (year, output) => {
        const result = leapYear(year);
        expect(result).toStrictEqual(output);
    });
});
