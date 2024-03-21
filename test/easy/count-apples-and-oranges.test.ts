import { describe, test, expect } from "bun:test";
import { countApplesAndOranges } from "~/easy/count-apples-and-oranges";
describe("Count apples and oranges", () => {
    test.each([
        [7, 10, 4, 12, 0, 0, [2, 3, -4], [3, -2, -4], [1, 2]],
        [7, 11, 5, 15, 3, 2, [-2, 2, 1], [5, -6], [1, 1]],
        [2, 3, 1, 5, 1, 1, [-2], [-1], [0, 0]],
        [2, 3, 1, 5, 1, 1, [2], [-2], [1, 1]],
    ])(
        "locations 🏡%d - %d 🍎🌳: %d 🍊🌳: %d fallen fruits 🍎: %d 🍊: %d",
        (
            s: number,
            t: number,
            a: number,
            b: number,
            m: number,
            n: number,
            apples: number[],
            oranges: number[],
            output,
        ) => {
            // prettier-ignore
            const result = countApplesAndOranges(s,t,a,b,m,n,apples,oranges,);
            expect(result).toStrictEqual(output);
        },
    );
});
