export const isPowerOfThree = (n: number): boolean => {
    if (n < 1) return false;
    while (n % 3 === 0) {
        n = Math.trunc(n / 3);
    }
    return n === 1;
};
