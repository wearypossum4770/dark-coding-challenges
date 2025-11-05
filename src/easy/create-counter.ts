export const createCounter = (n: number): (() => number) => {
    let count = n;
    return () => {
        const current = count;
        count++;
        return current;
    };
};
