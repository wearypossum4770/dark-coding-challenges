export const incrementItems = (arr: number[]): number[] =>
    arr.reduce((a: number[], c) => [...a, c + 1], []);
