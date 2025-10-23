export const numIdenticalPairs = (nums: number[]): number => {
    let count = 0;
    let left = 0;
    while (left < nums.length) {
        let right = left + 1;
        while (right < nums.length) {
            if (nums[left] === nums[right]) {
                count++;
            }
            right++;
        }
        left++;
    }
    return count;
};
