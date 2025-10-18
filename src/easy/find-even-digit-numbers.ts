export const findEvenDigitNumbers = (nums: number[]): number =>
    nums.filter((num) => num.toString().length % 2 === 0).length;
