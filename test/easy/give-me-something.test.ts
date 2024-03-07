import { describe, test, expect } from "bun:test";
import { giveMeSomething } from "~/easy/give-me-something";
describe('Return "something to Me!"', () => {
    test.each([
        ["a", "something a"],
        ["is cooking", "something is cooking"],
        [" is cooking", "something  is cooking"],
    ])("given the string %s returns %s", (strs, output) => {
        const result = giveMeSomething(strs);
        expect(result).toStrictEqual(output);
    });
});
