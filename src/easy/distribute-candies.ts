export const distributeCandies = (candyType: number[]): number =>
    Math.min(new Set(candyType).size, candyType.length / 2);
