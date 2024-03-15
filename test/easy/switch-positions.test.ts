import { describe, test, expect } from "bun:test";
import { switchPositions } from "~/easy/switch-positions";
describe("On/Off Switches", () => {
    test.each([
        [5, 32],
        [4, 16],
        [3, 8],
        [2, 4],
        [1, 2],
        [6, 64],
        [7, 128],
        [8, 256],
        [9, 512],
        [10, 1024],
        [25, 33554432],
    ])(
        "given %d switches there are %d possible positions",
        (switches, output) => {
            const result = switchPositions(switches);
            expect(result).toStrictEqual(output);
        },
    );
});
