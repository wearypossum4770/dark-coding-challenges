import { describe, test, expect } from "bun:test";
import { acceptIntoMovie } from "~/easy/accept-into-movie";
describe("Movie theatre admittance", () => {
    test.each([
        [14, true, true],
        [15, true, true],
        [16, true, true],
        [14, false, false],
        [15, false, true],
        [16, false, true],
        [14.99999, true, true],
        [14.99999, false, false],
    ])(
        "With an age of %d supervision is needed %o",
        (age, supervised, output) => {
            const result = acceptIntoMovie(age, supervised);
            expect(result).toStrictEqual(output);
        },
    );
});
