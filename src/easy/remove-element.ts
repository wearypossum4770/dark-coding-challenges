export const removeElement = (nums: number[], val: number): number => {
    let result = 0;
    for (let num of nums) {
        if (num !== val) {
            nums[result] = num;
            result++;
        }
    }
    return result;
};
