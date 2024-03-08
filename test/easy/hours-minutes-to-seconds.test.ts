import { describe, test, expect } from "bun:test";
import { hoursMinutesToSeconds } from "~/easy/hours-minutes-to-seconds";
describe("Convert hours and minutes to seconds", () => {
    test.each([
        [1, 0, 3_600],
        [1, 3, 3_780],
        [0, 30, 1_800],
    ])("%d hours and %d minutes is %d seconds", (hours, minutes, output) => {
        const result = hoursMinutesToSeconds(hours, minutes);
        expect(result).toStrictEqual(output);
    });
});
