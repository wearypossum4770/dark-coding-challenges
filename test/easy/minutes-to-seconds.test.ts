import { describe, test, expect } from "bun:test";
import { minutesToSeconds } from "~/easy/minutes-to-seconds";
describe("Minutes to seconds", () => {
    test.each([
        [6, 360],
        [4, 240],
        [8, 480],
        [60, 3600],
    ])("%d minutes is %d seconds", (minutes, output) => {
        const result = minutesToSeconds(minutes);
        expect(result).toStrictEqual(output);
    });
});
