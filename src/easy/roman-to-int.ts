const romanNumerals = new Map([
    ["I", 1],
    ["V", 5],
    ["X", 10],
    ["L", 50],
    ["C", 100],
    ["D", 500],
    ["M", 1_000],
]);
export const romanToInt = (roman: string): number => {
    const changeCase = roman.toUpperCase();
    return [...roman].reduce((a, c, i) => {
        const current = romanNumerals.get(c) ?? 0;
        const next = romanNumerals.get(changeCase[i + 1]) ?? 0;
        return current < next ? a - current : a + current;
    }, 0);
};
