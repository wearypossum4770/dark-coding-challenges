export const runningArraySum = (nums: number[]): number[] => {
    const result: number[] = Array(nums.length);
    for (let i = 0; i < nums.length; i++) {
        if (i === 0) {
            result[i] = nums[i];
        } else {
            result[i] = result[i - 1] + nums[i];
        }
    }
    return result;
};
