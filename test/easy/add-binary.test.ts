import { describe, test, expect } from "bun:test";
import { addBinary } from "@/src/easy/add-binary";
describe("addBinary", () => {
    test.each([
        ["11", "1", "100"],
        ["1010", "1011", "10101"],
    ])(
        "\n\tGiven: the binary strings '%s' and '%s'.\n\tThen: will be '%s' after adding",
        (a: string, b: string, output: string) => {
            const result = addBinary(a, b);
            expect(result).toStrictEqual(output);
        },
    );
});
