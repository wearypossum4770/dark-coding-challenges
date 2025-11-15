export const sumOfMultiples = (n: number): number => {
    let total = 0;
    for (let i = 1; i < n + 1; i++) {
        if (i % 3 === 0 || i % 5 === 0 || i % 7 === 0) {
            total += i;
        }
    }
    return total;
};
