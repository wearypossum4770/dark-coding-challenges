/**
 * @copyright https://leetcode.com/problems/plus-one/
 * @param digits
 */
export const plusOne = (digits: number[]): number[] => {
    let remainder = 0;
    const len = digits.length - 1;
    return digits.reduceRight(
        (accumulator: number[], current: number, index: number): number[] => {
            if (index === len && current < 9)
                return [current + 1].concat(accumulator);
            if (index === 0 && current > 8) return [1, 0].concat(accumulator);
            if (index === len && current >= 9) {
                remainder = 1;
                return [0].concat(accumulator);
            }
            if (current <= 8) {
                const value = current + remainder;
                remainder = 0;
                return [value].concat(accumulator);
            }
            if (current > 8 && !accumulator) {
                remainder = 1;
                return [current].concat(accumulator);
            }
            return accumulator;
        },
        [],
    );
};
