/**
 * [Hacker Rank](https://www.hackerrank.com/challenges/mark-and-toys/problem)
 * @param prices 
 * @param budget 
 * @returns 
 */
export const maximumToys = (prices: number[], budget: number): number => {
    prices.sort((a, b) => a - b);
    let toyCount = 0;
    prices.reduce((a, b) => {
        if (a + b> budget) return a
        toyCount +=1
        return a + b
    }, 0);
    return toyCount;
};
