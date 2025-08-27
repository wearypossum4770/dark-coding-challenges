export const singleNumber = (nums: number[]): number =>
    nums.reduce((a, b) => (a ^= b), 0);
