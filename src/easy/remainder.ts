export const remainder = (a: number, b: number): number => a % b;

export const divisibleByFive = (a: number): boolean => a % 5 === 0;

export const divisibleBy100 = (a: number) => remainder(a, 100) === 0;
