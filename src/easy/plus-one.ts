export const plusOne = (digits: number[]): number[] => {
    const result = digits;
    let remainder = 1;
    let index = digits.length - 1;
    while (index >= 0) {
        const sum = result[index] + remainder;
        if (sum <= 9) {
            result[index] = sum;
            return result;
        }
        result[index] = 0;
        remainder = 1;
        index--;
    }
    if (remainder > 0) {
        result.splice(0, 0, 1);
    }
    return result;
};
