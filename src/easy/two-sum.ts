export const twoSum = (nums: number[], target: number): number[] => {
    const previousValues: Record<number, number> = {};
    return nums.reduce((accum: number[], value: number, index: number) => {
        const neededValue = target - value;
        if (previousValues[neededValue] != null) {
            return [...accum, previousValues[neededValue], index];
        } else {
            previousValues[value] = index;
            return accum;
        }
    }, []);
};
