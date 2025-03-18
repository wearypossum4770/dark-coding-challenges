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
