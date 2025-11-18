import { sumOfConsecutiveNumbers } from "../helpers/number-tools";

export const findErrorNums = (nums: number[]): number[] => {
    if (nums.length === 2) return [1, 2];
    let total = sumOfConsecutiveNumbers(nums.length);
    const mismatch = [0, 0];
    const unique = new Set();
    for (let num of nums) {
        if (!unique.has(num)) {
            total -= num;
            unique.add(num);
        } else {
            mismatch[0] = num;
        }
    }
    mismatch[1] = total;
    return mismatch;
};
