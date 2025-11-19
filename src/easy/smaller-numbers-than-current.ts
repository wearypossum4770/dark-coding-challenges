export const smallerNumbersThanCurrent = (nums: number[]): number[] => {
    const result = Array(nums.length).fill(0);
    for (let i = 0; i < nums.length; i++) {
        for (let j = 0; j < nums.length; j++) {
            if (nums[i] > nums[j]) {
                result[i]++;
            }
        }
    }
    return result;
};
