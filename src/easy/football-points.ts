export const footballPoints = (
    wins: number,
    draws: number,
    losses: number,
): number => 3 * wins + draws + 0 * losses;
