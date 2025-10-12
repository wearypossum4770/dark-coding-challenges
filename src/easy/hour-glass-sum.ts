export const hourGlassSum = (matrix: number[][]): number => {
    let max = -Infinity;
    for (let i = 0; i < matrix.length - 2; i++) {
        for (let j = 0; j < matrix[i].length - 2; j++) {
            const sum =
                matrix[i][j] +
                matrix[i][j + 1] +
                matrix[i][j + 2] +
                matrix[i + 1][j + 1] +
                matrix[i + 2][j] +
                matrix[i + 2][j + 1] +
                matrix[i + 2][j + 2];
            max = Math.max(max, sum);
        }
    }
    return max;
};
