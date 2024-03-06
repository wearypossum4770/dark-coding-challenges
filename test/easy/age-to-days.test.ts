import { describe, test, expect } from "bun:test";
import { ageToDays } from "~/easy/age-to-days";
describe("Convert Age to days", () => {
    test.each([
        [10, 3650],
        [0, 0],
        [73, 26645],
    ])("Given the age %d the person is %d days old", (age, output) => {
        const result = ageToDays(age);
        expect(result).toStrictEqual(output);
    });
});
