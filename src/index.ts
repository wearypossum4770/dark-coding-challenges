import * as easy from "./easy";

export { easy };

export const SECOND_DAYS = 86_400;

export const max = (arr: number[]): number => Math.max.apply(null, arr);
export const countArrayString = (arr: string[]) =>
    arr.map(({ length }) => length);
export const longestArrayString = (arr: string[]) => max(countArrayString(arr));

export const metricPrefix = (value: number): string =>
    new Map<number, string>([
        [10e30, "quetta"],
        [10e27, "ronna"],
        [10e24, "yotta"],
        [10e21, "zetta"],
        [10e18, "exa"],
        [10e15, "peta"],
        [10e12, "tera"],
        [10e9, "giga"],
        [10e6, "mega"],
        [10e3, "kilo"],
    ]).get(value) ?? "";
