export const differenceOfSums = (n: number, m: number): number => {
    let lhs = 0;
    let rhs = 0;
    for (let i = 1; i < n + 1; i++) {
        if (i % m == 0) {
            rhs += i;
        } else {
            lhs += i;
        }
    }

    return lhs - rhs;
};
