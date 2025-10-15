const allocateArray = (length: number): number[] =>
    Array.from({ length }, () => 1);
const createMatrix = (length: number): number[][] =>
    Array.from({ length }, (_, i) => allocateArray(i + 1));

export const pascalsTriangle = (numRows: number): number[][] => {
    const result = createMatrix(numRows);
    if (numRows < 0) return [];
    for (let i = 1; i < numRows; i++) {
        for (let j = 1; j < i; j++) {
            result[i][j] = result[i - 1][j - 1] + result[i - 1][j];
        }
    }
    return result;
};
