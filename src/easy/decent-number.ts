/**
 * [Hacker Rank](https://www.hackerrank.com/challenges/sherlock-and-the-beast/problem)
 * @param n
 * @returns
 */
export const decentNumber = (n: number) => {
    let fives = n;
    while (fives % 3 !== 0) {
        fives -= 5;
    }
    return fives >= 0 ? "5".repeat(fives) + "3".repeat(n - fives) : "-1";
};
