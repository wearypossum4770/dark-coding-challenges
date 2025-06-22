// https://edabit.com/challenge/aewSLr2r2LMSDhPxf
// https://leetcode.com/problems/majority-element/
export const majorityElement = (
    nums: Array<number | string>,
): number | null => {
    const half = nums.length / 2;
    const freq = new Map();
    for (const num of nums) {
        freq.set(num, (freq.get(num) ?? 0) + 1);
    }
    for (const [key, value] of freq.entries()) {
        if (value > half) return key;
    }
    return null;
};
