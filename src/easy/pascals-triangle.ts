import { range } from "~/core";
export const pascalsTriangle = (numRows: number) => {
    if (numRows === 0) return [];
    if (numRows === 1) return [[1]];
    const target = range(numRows).map((b) => range(b, true));
    for (let i = 0; i < target.length; i++) {
        const len = target[i].length;
        for (let j = 0; j < len; j++) {
            if (j === 0 || j === len - 1) {
                target[i][j] = 1;
            } else {
                target[i][j] = target[i - 1][j] + target[i - 1][j - 1];
            }
        }
    }
    return target;
};

console.log(pascalsTriangle(5));
// [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
