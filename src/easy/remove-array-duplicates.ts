export const removeArrayDuplicates = (nums: number[]): number => {
    let count = 0;
    nums.forEach((n) => {
        if (n != nums[count]) {
            ++count;
            nums[count] = n;
        }
    });
    return count + 1;
};
