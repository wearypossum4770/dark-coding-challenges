/**
 * @description Function to find the indices of the two numbers that add up to the target.
 * # Two Sum Challenge
 * - [Leet Code](https://leetcode.com/problems/two-sum/description/)
 * @example <caption>Explanation: Because nums[0] + nums[1] == 9</caption>
 * // returns [0, 1]
 * const nums = [2, 7, 11, 15];
 * const target = 9;
 * const result = twoSum(nums, target);
 * console.log(result); //Output:  [0, 1]
 * @param nums - An array of integers.
 * - Example: [2, 7, 11, 15]
 * @param target - the target sum.
 * - Example: 9
 * @returns The indices of the two numbers that ad up to the target
 * - Example:  [0, 1]
 */
export const twoSum = (nums: number[], target: number): number[] => {
    const mapper = new Map<number, number>();
    for (let i = 0; i < nums.length; i++) {
        const complement = mapper.get(target - nums[i]);
        if (complement) {
            return [complement, i];
        }
        mapper.set(nums[i], i);
    }
    return [];
};
