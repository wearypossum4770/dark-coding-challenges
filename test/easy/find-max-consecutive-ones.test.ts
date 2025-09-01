import { describe, test, expect } from "bun:test";
import { findMaxConsecutiveOnes } from "@/src/easy/find-max-consecutive-ones";
describe("findMaxConsecutiveOnes", () => {
    test.each([
        [[1, 1, 0, 1, 1, 1], 3],
        [[1, 0, 1, 1, 0, 1], 2],
    ])(
        "\n\tGiven: the binary array %p.\n\tThen: its maximum consecutive ones is %i",
        (inputs: number[], output: number) => {
            const result = findMaxConsecutiveOnes(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
