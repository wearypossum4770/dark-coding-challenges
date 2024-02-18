import * as easy from "./easy";

export { easy };

export const max = (arr: number[]): number => Math.max.apply(null, arr);
export const countArrayString = (arr: string[]) =>
    arr.map(({ length }) => length);
export const longestArrayString = (arr: string[]) => max(countArrayString(arr));
