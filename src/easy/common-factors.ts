export const commonFactors = (a: number, b: number): number => {
    let count = 0;
    const max = (a > b ? a : b) + 1;
    for (let i = 1; i < max; i++) {
        if (a % i === 0 && b % i === 0) {
            count++;
        }
    }
    return count;
};
