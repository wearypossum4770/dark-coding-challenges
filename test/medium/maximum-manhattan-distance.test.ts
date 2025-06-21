import { describe, test, expect } from "bun:test";
import { maximumManhattanDistance } from "@/src/medium/maximum-manhattan-distance";
describe("maximumManhattanDistance", () => {
test.each([])("", (inputs, output) => {
const result = maximumManhattanDistance(inputs);
expect(result).toStrictEqual(output);
});
});