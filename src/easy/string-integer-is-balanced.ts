export const stringIntegerIsBalanced = (num: string): boolean => {
    let even = 0;
    let odd = 0;
    Array.from(num).forEach((current, index) => {
        if (index % 2 === 0) {
            even += Number(current);
        } else {
            odd += Number(current);
        }
    });
    return odd === even;
};
