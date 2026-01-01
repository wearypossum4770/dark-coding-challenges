import { describe, test, expect } from "bun:test";
import { thirdMax } from "@/src/easy/third-max";
describe("\n\tFeature: Third Max Integer in the Array", () => {
test.each([
		[[3, 2, 1], 1],
	[[1, 2], 2],
	[[2, 2, 3, 1], 1],
	[[1, 2, 3, 4, 5], 3],
	[[5, 4, 3, 2, 1], 3],
	[[10, 20, 30, 40], 20],
	[[5, 5, 3, 2], 2],
	[[1, 2, 2, 3, 3], 1],
	[[-1, -2, -3, -4], -3],
	[[-10, -20, -30], -30],
	[[-10, 0, 10], -10],
	[[0, -1, 1, 2], 0],
	[[4, 4, 4, 3, 3, 2], 2],
	[[-5, -1, -3], -5],
	[[-2, -1, 0, 1, 2], 0],
])("\n\tGiven: the array %p.\n\tThen: the third largest integer is %i", (inputs: number[], output: number) => {
const result = thirdMax(inputs);
expect(result).toStrictEqual(output);
});
});