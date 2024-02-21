/**
 * @copyright https://www.hackerrank.com/challenges/find-digits/problem
 * duplicatesAllowed: true
 * Hacker Rank - Find Digits Challenge.
 * @param num an integer where ech digit
 * @returns the number of divisible digits in the number
 */
export const findDigits = (num: number): number => {
    return [...num.toString()].reduce((accum, curr) => {
        if (curr === "0") return accum;
        return num % parseInt(curr) === 0 ? accum + 1 : accum;
    }, 0);
};
