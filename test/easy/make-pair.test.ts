
import { describe, test, expect } from "bun:test";
import { makePair } from '~/easy/make-pair'
describe('Pair management', () => {
test.each([
[1, 2, [1, 2]],
[21, 82, [21, 82]],
[4213, 526, [4213, 526]],
])('the values %d & %d are %o', (a, b, output) => {
const result = makePair(a, b)
expect(result).toStrictEqual(output)
})
})