import { describe, test, expect } from "bun:test";
import { arrayStack } from "@/src/medium/array-stack";
describe("arrayStack", () => {
    test.each([
        [[1, 3], 3, ["Push", "Push", "Pop", "Push"]],
        [[1, 2, 3], 3, ["Push", "Push", "Push"]],
        [[1, 2], 4, ["Push", "Push"]],
        [[1], 1, ["Push"]],
        [[1], 100, ["Push"]],
        [[2], 2, ["Push", "Pop", "Push"]],
        [[3], 3, ["Push", "Pop", "Push", "Pop", "Push"]],
        [[2, 3, 4], 4, ["Push", "Pop", "Push", "Push", "Push"]],
        [
            [1, 3, 5, 7],
            7,
            [
                "Push",
                "Push",
                "Pop",
                "Push",
                "Push",
                "Pop",
                "Push",
                "Push",
                "Pop",
                "Push",
            ],
        ],
        [
            [5],
            5,
            [
                "Push",
                "Pop",
                "Push",
                "Pop",
                "Push",
                "Pop",
                "Push",
                "Pop",
                "Push",
            ],
        ],
        [
            Array.from({ length: 100 }, (_, i) => i + 1),
            100,
            Array(100).fill("Push"),
        ],
        [
            [4, 5],
            5,
            ["Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Push"],
        ],
        [[1, 2, 4], 4, ["Push", "Push", "Push", "Pop", "Push"]],
    ])(
        "\n\tGien a stream of values %p.\n\tWhen: stacking integers from 1 to %i.\n\tThen: it will have %p operations",
        (target: number[], n: number, output: string[]) => {
            const result = arrayStack(target, n);
            expect(result).toStrictEqual(output);
        },
    );
});
