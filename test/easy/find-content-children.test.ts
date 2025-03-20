import { describe, test, expect } from "bun:test";
import { findContentChildren } from "@/src/easy/find-content-children";
describe("findContentChildren", () => {
    test.each([
        [[1, 2, 3], [1, 1], 1],
        [[1, 2], [1, 2, 3], 2],
        [[10, 9, 8, 7], [5, 6, 7, 8], 2],
        [[], [1, 2], 0],
        [[1, 2], [], 0],
    ])(
        "Given a list of hangry children %p and some number of cookies %p, then %i kids will be satisfied.",
        (children: number[], cookies: number[], expected: number) => {
            const result = findContentChildren(children, cookies);
            expect(result).toStrictEqual(expected);
        },
    );
});
