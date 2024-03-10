export const remainder = (numerator: number, denominator: number): number => numerator % denominator;

export const divisibleByFive = (numerator: number): boolean => dividesEvenly(numerator,5)

export const divisibleBy100 = (numerator: number): boolean => dividesEvenly(numerator, 100);

export const dividesEvenly = (numerator: number, denominator: number): boolean =>
    remainder(numerator, denominator) === 0;
