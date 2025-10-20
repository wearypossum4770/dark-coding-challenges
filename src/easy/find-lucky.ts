export const findLucky = (arr: number[]): number => {
    const nums = Array(Math.max(...arr) + 1).fill(0);
    for (const num of arr) {
        nums[num]++;
    }
    for (let i = arr.length; i > 0; i--) {
        if (i === nums[i]) return i;
    }
    return -1;
};
