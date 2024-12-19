/**
 * @copyright [Hacker Rank](https://www.hackerrank.com/challenges/pairs/problem)
 * @param k
 * @param arr
 * @returns
 */
export const pairs = (k: number, arr: number[]) => {
    let count = 0;
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length; j++) {
            if (i === j) break;
            if (Math.abs(arr[i] - arr[j]) === k) {
                count += 1;
            }
        }
    }
    return count;
};
