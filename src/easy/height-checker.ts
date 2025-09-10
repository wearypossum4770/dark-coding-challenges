export const heightChecker = (heights: number[]): number => {
    const nums = [...heights];
    nums.sort((a, b) => a - b);
    console.log(nums, heights);
    return nums.reduce((a, b, i) => a + (heights[i] !== b ? 1 : 0), 0);
};
