import { FenwickTree } from "../helpers/data-structures";

export const twoWaysDistribution = (nums: number[]): number[] => {
    const sorted = [...new Set(nums)].sort((a, b) => a - b);
    const index = new Map(sorted.map((v, i) => [v, i + 1]));
    const firstTree = new FenwickTree(sorted.length),
        secondTree = new FenwickTree(sorted.length);
    const first: number[] = [nums[0]];
    const second: number[] = [nums[1]];
    firstTree.update(index.get(nums[0])!, 1);
    secondTree.update(index.get(nums[1])!, 1);

    for (const num of nums.slice(2)) {
        const rank = index.get(num)!;
        const fCount = firstTree.countGreater(rank);
        const sCount = secondTree.countGreater(rank);

        if (fCount === sCount) {
            if (second.length < first.length) {
                second.push(num);
                secondTree.update(rank, 1);
            } else {
                first.push(num);
                firstTree.update(rank, 1);
            }
        } else if (fCount > sCount) {
            first.push(num);
            firstTree.update(rank, 1);
        } else {
            second.push(num);
            secondTree.update(rank, 1);
        }
    }

    return first.concat(second);
};
