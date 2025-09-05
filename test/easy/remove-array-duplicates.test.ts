import { describe, test, expect } from "bun:test";
import { removeArrayDuplicates } from "@/src/easy/remove-array-duplicates";
describe("removeArrayDuplicates", () => {
    test.each([
        [[1, 1, 2], 2],
        [[1, 2, 2, 3, 3], 3],
        [[1, 1, 2, 2, 3, 3, 4], 4],
    ])(
        "\n\tGiven: an array %p.\n\tWhen: duplicates are removed.\n\tThen: it will have %d elements",
        (inputs: number[], output: number) => {
            const result = removeArrayDuplicates(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
