import { describe, test, expect } from "bun:test";
import { pairs } from "~/medium/pairs";
describe("Test pairs", () => {
    test.each([
        [[1, 5, 3, 4, 2], 2, 3],
        // prettier-ignore
        [[363374326, 364147530, 61825163, 1073065718, 1281246024, 1399469912, 428047635, 491595254, 879792181, 1069262793, ], 1, 0],
        [[1, 3, 5, 8, 6, 4, 2], 2, 5],
    ])(
        "Count pairs of integers of %p are within %i units",
        (arr: number[], k: number, output) => {
            const result = pairs(k, arr);
            expect(result).toStrictEqual(output);
        },
    );
});
