export type RecordKeyOf<T extends Record<string, any>, K extends keyof T> = {};

export const isEmpty = <T, U extends Record<string, any>>(
    value: T[] | U,
): boolean => Object.keys(value).length === 0;

export const decimalToBinary = (decimalNumber: number): string =>
    decimalNumber.toString(2);

export const counter = (input: string): Record<string, number> =>
    [...input].reduce(
        (a: Record<string, number>, c: string) => ({
            ...a,
            [c]: typeof a[c] === "undefined" ? 1 : a[c] + 1,
        }),
        {},
    );
export const orderChars = (input: string): string => [...input].sort().join("");

export const range = (stop: number, inclusive?: boolean): Array<number> => {
    const isInclusive = typeof inclusive === "boolean" ? inclusive : false;
    const end = isInclusive ? 1 : 0;
    return [...Array(stop + end).keys()];
};
