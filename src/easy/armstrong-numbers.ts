export const armstrongNumbers = (num: number): number => {
    if (num < 0) return 0;
    const digits = Array.from(num.toString()).map(Number);
    const sum = digits.reduce((a, b) => a + Math.pow(b, digits.length), 0);
    return sum === num ? 1 : 0;
};
