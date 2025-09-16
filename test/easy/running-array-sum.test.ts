import { describe, test, expect } from "bun:test";
import { runningArraySum } from "@/src/easy/running-array-sum";
describe("runningArraySum", () => {
test.each([
["✅ Normal case", [1, 2, 3, 4], [1, 3, 6, 10]],
["✅ All 1s", [1, 1, 1, 1, 1], [1, 2, 3, 4, 5]],
["✅ Mixed values", [3, 1, 2, 10, 1], [3, 4, 6, 16, 17]],
["🟢 Empty array", [], []],
["🟢 Single element", [5], [5]],
["🟢 Negative numbers", [-1, -2, -3], [-1, -3, -6]],
["🟢 Alternating positives & negatives", [1, -1, 1, -1, 1], [1, 0, 1, 0, 1]],
])("\n\tCriteria: %s.\n\tGiven: the array %p.\n\tThen: it's running sum is %p", (criteria: string, inputs: number[], output: number[]) => {
const result = runningArraySum(inputs);
expect(result).toStrictEqual(output);
});
});