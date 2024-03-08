export const printArray = (size: number): Array<number> =>
    [...Array(size + 1).keys()].slice(1);
