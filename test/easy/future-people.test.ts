import { describe, test, expect } from "bun:test";
import { futurePeople } from "~/easy/future-people";
describe("Century crisis", () => {
    test.each([
        [256, 2, 976],
        [3248, 6, 5408],
        [5240, 3, 6320],
    ])(
        "starting population of %d with monthly births of %d gives populaton of %d",
        (population, births, output) => {
            const result = futurePeople(population, births);
            expect(result).toStrictEqual(output);
        },
    );
});
