export const topFrequentElements = (nums: number[], k: number): number[] => {
    const freq = new Map<number, number>();
    for (const num of nums) {
        freq.set(num, (freq.get(num) ?? 0) + 1);
    }
    const result = [...freq.entries()].toSorted((a, b) => b[1] - a[1]);

    return result.slice(0, k).flatMap((value) => value[0]);
};
