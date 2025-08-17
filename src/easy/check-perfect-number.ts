export const classifyPerfectNumber = (n: number): string => {
    const num = calculatePerfectNumber(n);
    if (n < num) return "abundant";
    if (n > num) return "deficient";
    return "perfect";
};
const calculatePerfectNumber = (n: number): number => {
    if (n === 1) return 0;
    let total = 1;
    const root = n ** 0.5;
    for (let i = 2; i <= root; i++) {
        if (n % i === 0) {
            total += i;
            const other = n / i;
            if (other !== i) total += other;
        }
    }
    return total;
};
export const checkPerfectNumber = (n: number): boolean =>
    n <= 0 ? false : n === calculatePerfectNumber(n);
