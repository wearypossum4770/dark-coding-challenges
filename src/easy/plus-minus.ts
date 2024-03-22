export const plusMinus = (target: number[]): number[] => {
    const length = target.length;
    const [left, right] = target.reduce(
        (accum: number[], num: number) => {
            if (num > 0) accum[0] += 1;
            if (num < 0) accum[1] += 1;
            return accum;
        },
        [0, 0],
    );
    const l = left / length;
    const r = right / length;
    const middle = 1 - (l + r);
    return [l.toFixed(3), r.toFixed(3), middle.toFixed(3)].map(Number);
};

console.log(plusMinus([0, 0, -1, 1, 1]), [0.4, 0.2, 0.4]);
