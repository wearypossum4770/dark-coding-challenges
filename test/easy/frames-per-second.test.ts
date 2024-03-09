
import { describe, test, expect } from "bun:test";
import { framesPerSecond } from '~/easy/frames-per-second'
describe('Frames per second', () => {
test.each([
[1, 1, 60],
[10, 1, 600],
[10, 25, 15_000],
[500, 60, 1_800_000],
[0, 60, 0],
[99, 1, 5_940],
[419, 70, 1_759_800],
[52, 33, 102_960],
])('in %d minutes with %d fsp %d frames are shown', (minutes, fps, output) => {
const result = framesPerSecond(minutes, fps)
expect(result).toStrictEqual(output)
})
})