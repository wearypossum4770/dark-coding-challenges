export const makesTen = (a: number, b: number): boolean => {
    if (a === 10 || b === 10) return true;
    return a + b === 10;
};
