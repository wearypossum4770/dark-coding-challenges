/**
 * Returns the sum of all consecutive positive integers from 1 to n.
 * Uses the Gauss formula: n(n + 1) / 2.
 *
 * @param n - A non-negative integer
 */
export const sumOfConsecutiveNumbers = (n: number): number => {
    if (!Number.isInteger(n) || n < 0) {
        throw new Error("n must be a non-negative integer");
    }
    return (n * (n + 1)) / 2;
};
/**
 * Returns sum(1..n) using BigInt, safe for extremely large n.
 *
 * @param n - bigint (must be non-negative)
 */
export const sumOfConsecutiveNumbersBigInt = (n: bigint): bigint => {
    if (n < 0n) {
        throw new Error("n must be a non-negative bigint");
    }

    return (n * (n + 1n)) / 2n;
};

const testCases = [
    [0, 0],
    [1, 1],
    [5, 15],
    [10, 55],
    [100, 5050],
    [1000, 500500],
];
