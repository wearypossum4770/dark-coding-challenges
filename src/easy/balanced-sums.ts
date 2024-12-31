export type YesNo = "YES" | "NO";
export const balancedSums = (arr: number[]) => {
    let left = 0;
    let right = arr.reduce((accum, curr) => accum + curr, 0);
    for (const num of arr) {
        right -= num;
        if (left === right) return "YES";
        left += num;
    }
    return "NO";
};
