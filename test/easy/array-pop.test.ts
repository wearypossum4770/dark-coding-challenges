import { describe, test, expect } from "bun:test";
import { arrayPop } from "~/easy/array-pop";
describe("Get first item from array", () => {
    test.each([
        [[1, 2, 3], 1],
        [[80, 5, 100], 80],
        [[-500, 0, 50], -500],
        [[5, 2, 3], 5],
        [[75675, 5, 100], 75675],
        [[-52320, 0, 50], -52320],
    ])("the first item from %o is %o", (strs, output) => {
        const result = arrayPop(strs);
        expect(result).toStrictEqual(output);
    });
});
