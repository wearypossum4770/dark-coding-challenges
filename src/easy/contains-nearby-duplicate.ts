export const containsNearbyDuplicate = (nums: number[], k: number): boolean => {
    const seen = new Map<number, number>();
    for (let i = 0; i < nums.length; i++) {
        const num = seen.get(nums[i]);
        if (num !== undefined && Math.abs(i - num) <= k) return true;
        seen.set(nums[i], i);
    }
    return false;
};
