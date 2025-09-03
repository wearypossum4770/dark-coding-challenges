export const removeDuplicateZeros = (nums: number[]): void => {
    let zeros = nums.filter((v) => v === 0).length;
    for (let i = nums.length - 1; i >= 0; i--) {
        const j = i + zeros;
        if (j < nums.length) {
            nums[j] = nums[i];
        }
        if (nums[i] === 0) {
            zeros--;
            const k = i + zeros;
            if (k < nums.length) {
                nums[k] = 0;
            }
        }
    }
};
