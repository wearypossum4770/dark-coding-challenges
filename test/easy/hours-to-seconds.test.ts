import { describe, test, expect } from "bun:test";
import { hoursToSeconds } from "~/easy/hours-to-seconds";
describe("Convert Hours to seconds", () => {
    test.each([
        [2, 7200],
        [10, 36000],
        [24, 86400],
        [36, 129600],
    ])("%d hours is %d seconds.", (strs, output) => {
        const result = hoursToSeconds(strs);
        expect(result).toStrictEqual(output);
    });
});
