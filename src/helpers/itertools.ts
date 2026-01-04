// const _ = await import('lodash');

export const UPPER_ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

export const frequencyMap = <T>(values: T | T[]): Map<T, number> => {
    const frequency = new Map();
    if (values == null) return frequency;
    if (Array.isArray(values)) {
        values.forEach((c) => frequency.set(c, (frequency.get(c) ?? 0) + 1));
        return frequency;
    }
    switch (typeof values) {
        case "string":
            Array.from(values).forEach((c) =>
                frequency.set(c, (frequency.get(c) ?? 0) + 1),
            );
            break;
        case "undefined":
            break;
        case "symbol":
            break;
        default:
            break;
    }
    return frequency;
};
export const rangeFrom = (n: number): number[] =>
    Array.from({ length: n }, (_, i) => i).slice(1);

export function* rangeFromGenerator(n: number): Generator<number> {
    for (let i = 1; i < n; i++) {
        yield i;
    }
}

// const shuffle = s => _.shuffle([...s]).join('');

// export const randomModifyStr = (s) => {
// 	const t = shuffle(s),
// 		r = Math.random();
// 	if (r < 0.25) return randomAddChar(t);
// 	if (r < 0.5) return randomDeleteChar(t);
// 	if (r < 0.75) return randomEditChar(t);
// 	return randomChangeCase(t);
// };
