import { describe, test, expect } from "bun:test";
import { raindrops } from "~/easy/raindrops";
describe("", () => {
    test.each([
        [1, "1"],
        [3, "Pling"],
        [5, "Plang"],
        [7, "Plong"],
        [6, "Pling"],
        [9, "Pling"],
        [10, "Plang"],
        [14, "Plong"],
        [15, "PlingPlang"],
        [21, "PlingPlong"],
        [25, "Plang"],
        [35, "PlangPlong"],
        [49, "Plong"],
        [52, "52"],
        [105, "PlingPlangPlong"],
        [12121, "12121"],
    ])("covert %d to rain drops %s", (drop: number, output: string) => {
        const result = raindrops(drop);
        expect(result).toStrictEqual(output);
    });
});
