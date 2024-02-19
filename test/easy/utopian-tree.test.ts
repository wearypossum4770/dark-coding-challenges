import { describe, test, expect } from "bun:test";
import { utopianTree } from "~/easy/utopian-tree";
describe("Utopian Tree Problem", () => {
    test.each([
        [0, 1],
        [1, 2],
        [4, 7],
        [3, 6],
        [17, 1022],
        [16, 511],
        [19, 2046],
        [20, 2047],
        [18, 1023],
        [21, 4094],
        [27, 32766],
        [26, 16383],
        [25, 16382],
        [22, 4095],
        [28, 32767],
        [23, 8190],
        [24, 8191],
        [14, 255],
        [13, 254],
        [12, 127],
        [11, 126],
        [15, 510],
    ])("Given a tree with growth cycles %o determine the correct amount of growth of %o", async (cycle, output) => {
        const result = utopianTree(cycle);
        expect(result).toStrictEqual(output);
    });
});
