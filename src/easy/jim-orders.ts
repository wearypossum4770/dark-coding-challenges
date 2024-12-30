/**
 * @copyright [Hacker Rank](https://www.hackerrank.com/challenges/jim-and-the-orders/problem)
 * - [refactor inspiraton](https://www.hackerrank.com/rest/contests/master/challenges/jim-and-the-orders/hackers/christopherborum/download_solution)
 * @param orders
 * @returns
 */
export const jimOrders = (orders: number[][]): number[] => {
    const result = orders.map(([delivery, prepTime], index) => [
        index + 1,
        prepTime + delivery,
    ]);
    result.sort((a, b) => a[1] - b[1] || a[0] - b[0]);
    return result.map((pair) => pair[0]);
};
