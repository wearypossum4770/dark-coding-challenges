import { describe, test, expect } from "bun:test";
import { dartScore } from "~/easy/dart-score";
describe("Exercism Dart Score", () => {
    test.each([
        ["Missed target", -9, 9, 0],
        ["On the outer circle", 0, 10, 1],
        ["On the middle circle", -5, 0, 5],
        ["On the inner circle", 0, -1, 10],
        ["Exactly on centre", 0, 0, 10],
        ["Near the centre", -0.1, -0.1, 10],
        ["Just within the inner circle", 0.7, 0.7, 10],
        ["Just outside the inner circle", 0.8, -0.8, 5],
        ["Just within the middle circle", -3.5, 3.5, 5],
        ["Just outside the middle circle", -3.6, -3.6, 1],
        ["Just within the outer circle", -7.0, 7.0, 1],
        ["Just outside the outer circle", 7.1, -7.1, 0],
        [
            "Asymmetric position between the inner and middle circles",
            0.5,
            -4,
            5,
        ],
    ])(
        "\n\tTest: %# If the dart strikes %s with ordered piar (%d,%d) give %d points",
        async (_rule, x, y, output) => {
            const result = dartScore(x as number, y as number);
            expect(result).toStrictEqual(output);
        },
    );
});
