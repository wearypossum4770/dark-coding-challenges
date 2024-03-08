import { describe, test, expect } from "bun:test";
import { footballPoints } from "~/easy/football-points";
describe("Football Points", () => {
    test.each([
        [1, 2, 3, 5],
        [5, 5, 5, 20],
        [1, 0, 0, 3],
        [0, 7, 0, 7],
        [0, 0, 15, 0],
    ])(
        "with %d wins %d draws and %d loses points are %d",
        (wins: number, draws: number, losses: number, output: number) => {
            const result = footballPoints(wins, draws, losses);
            expect(result).toStrictEqual(output);
        },
    );
});
