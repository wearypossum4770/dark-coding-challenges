export const countApplesAndOranges = (
    s: number,
    t: number,
    a: number,
    b: number,
    m: number,
    n: number,
    apples: number[],
    oranges: number[],
): number[] => {
    const appleDistances = apples.reduce((accum: number, curr: number) => {
        const value = a + curr;
        return accum + (s <= value && t >= value ? 1 : 0);
    }, 0);
    const orangeDistances = oranges.reduce(
        (accum: number, curr: number, index: number) => {
            const value = b + curr;
            return accum + (s <= value && t >= value ? 1 : 0);
        },
        0,
    );
    return [appleDistances, orangeDistances];
};
