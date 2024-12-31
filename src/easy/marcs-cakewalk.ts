/**
 * [Marc's Cakewalk](https://www.hackerrank.com/challenges/marcs-cakewalk/problem)
 * @param calorie
 * @returns
 */

export const marcsCakewalk = (calorie: number[]): number =>
    calorie
        .sort((a, b) => b - a)
        .reduce((a, b, i) => a + Math.pow(2, i) * b, 0);
