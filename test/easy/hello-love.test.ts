import { describe, test, expect } from "bun:test";
import { helloLove } from "~/easy/hello-love";
describe("", () => {
    test.each([])("", (strs, output) => {
        const result = helloLove(strs);
        expect(result).toStrictEqual(output);
    });
});
