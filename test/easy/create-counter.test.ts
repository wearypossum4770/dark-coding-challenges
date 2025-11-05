import { describe, test, expect } from "bun:test";
import { createCounter } from "@/src/easy/create-counter";
describe("createCounter", () => {
    test.each([
        [10, ["c", "c", "c"], [10, 11, 12]],
        [-2, ["c", "c", "c", "c", "c"], [-2, -1, 0, 1, 2]],
        [0, [], []],
        [1000, ["c"], [1000]],
        [0, ["c"], [0]],
        [0, [], []],
        [999, ["c", "c", "c"], [999, 1000, 1001]],
        [-1_000, ["c", "c"], [-1000, -999]],
        [
            3,
            ["c", "c", "c", "c", "c", "c", "c", "c", "c", "c"],
            [3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        ],
        [
            42,
            [
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
                "c",
            ],
            [
                42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57,
                58, 59, 60, 61,
            ],
        ],
        [7, ["c"], [7]],
        [100, ["c", "c", "c", "c", "c"], [100, 101, 102, 103, 104]],
        [-1000, ["c", "c", "c"], [-1000, -999, -998]],
    ])(
        "\n\tGiven: a closure.\n\tAnd: a initial value of %i.\n\tWhen: the closure stack has %p.\n\tThen: it will output %p",
        (n: number, operations: string[], output: number[]) => {
            const closure = createCounter(n);
            const actual = operations.map(() => closure());
            expect(actual).toStrictEqual(output);
        },
    );
});
