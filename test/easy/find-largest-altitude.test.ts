import { describe, expect, test } from "bun:test";
//biome-ignore format: manual alignment for readability
import { findLargestAltitude } from "@/src/easy/find-largest-altitude";

describe("findLargestAltitude", () => {
	test.each([
		[[-5, 1, 5, 0, -7], 1],
		[[-4, -3, -2, -1, 4, 3, 2], 0],
		[[0], 0],
		[[100], 100],
		[[-100], 0], // Never goes positive — should return 0 (start)
		[[1], 1],

		// All zeros
		[[0, 0, 0, 0], 0],

		// All positive (monotonically increasing altitude)
		[[1, 2, 3, 4, 5], 15],

		// All negative (never exceeds starting altitude of 0)
		[[-1, -2, -3, -4, -5], 0],

		// All same value
		[[5, 5, 5, 5], 20],
		[[-5, -5, -5, -5], 0],

		// Spike then drop — peak is in the middle
		[[10, -20, 10], 10],

		// Gradual climb then cliff — highest at end before drop
		[[1, 1, 1, 1, -100], 4],

		// Immediate cliff, slow recovery — starts at worst
		[[-100, 1, 1, 1, 1], 0],

		// Large oscillations
		[[50, -100, 50, -100, 50], 50],

		// Peak at very start (first gain is massive)
		[[100, -100, -100, -100], 100],
		// Cumulative sum never goes positive except at start
		[[-1, -1, -1, 1, 1], 0],

		// Sum bounces around 0
		[[1, -1, 1, -1, 1, -1], 1],

		// Peak is the last element
		[[1, 1, 1, 1, 1], 5],

		// Exactly at boundary: n=1
		[[-100], 0],
		[[100], 100],
		// Max constraint values: n=100, gain[i]=100
		[Array(100).fill(100), 10000],

		// Max constraint values: all -100
		[Array(100).fill(-100), 0],

		// Alternating +100/-100
		[
			Array(50)
				.fill(0)
				.flatMap(() => [100, -100]),
			100,
		],

		// (correct tuple form below)
		[[...Array(50).fill(0), 100], 100],

		// Spike then long flat
		[[100, ...Array(50).fill(0)], 100],

		// Peak somewhere in middle of 100 elements
		[[...Array(49).fill(1), -200, ...Array(50).fill(1)], 49],
	])("\n\tGiven: the heights %p.\n\tThen: the maximum height is %i.", (inputs: number[], expected: number) => {
		const result = findLargestAltitude(inputs);
		expect(result).toStrictEqual(expected);
	});
});
