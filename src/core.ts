export const counter = (input: string): Record<string, number> =>
    [...input].reduce(
        (a: Record<string, number>, c: string) => ({
            ...a,
            [c]: typeof a[c] === "undefined" ? 1 : a[c] + 1,
        }),
        {},
    );
export const orderChars = (input: string): string => [...input].sort().join("");
