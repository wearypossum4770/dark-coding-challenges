export const arrayContainsDuplicate = (nums: number[]): boolean => {
    const seen = new Set();
    for (const num of nums) {
        if (seen.has(num)) return true;
        seen.add(num);
    }
    seen.clear();
    return false;
};
