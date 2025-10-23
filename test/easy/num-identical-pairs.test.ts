import { describe, test, expect } from "bun:test";
import { numIdenticalPairs } from "@/src/easy/num-identical-pairs";
describe("numIdenticalPairs", () => {
    test.each([
        [[1, 1, 1, 1], 6],
        [[1, 2, 3], 0],
        [[1, 2, 3, 1, 1, 3], 4],
    ])(
        "\n\tGiven: the numbers %p.\n\tThen: there are $i identical pairs",
        (inputs: number[], output: number) => {
            const result = numIdenticalPairs(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
