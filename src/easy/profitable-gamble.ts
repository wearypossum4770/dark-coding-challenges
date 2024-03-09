export const profitableGamble = (
    probability: number,
    prize: number,
    cost: number,
): boolean => probability * prize > cost;
