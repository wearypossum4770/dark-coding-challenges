import { describe, test, expect } from "bun:test";
import { incrementItems } from "~/easy/increment-items";
describe("Increment items", () => {
    test.each([
        [
            [0, 1, 2, 3],
            [1, 2, 3, 4],
        ],
        [
            [2, 4, 6, 8],
            [3, 5, 7, 9],
        ],
        [
            [-1, -2, -3, -4],
            [0, -1, -2, -3],
        ],
    ])("incrementing %o by one gives %o", (items, output) => {
        const result = incrementItems(items);
        expect(result).toStrictEqual(output);
    });
});
