export const minDeletionSize = (strs: string[]): number => {
    let count = 0;
    let rows = strs.length;
    let cols = strs[0].length;
    for (let col = 0; col < cols; col++) {
        let row = 1;
        while (row < rows) {
            if (strs[row - 1][col] > strs[row][col]) {
                count++;
                break;
            }
            row++;
        }
    }
    return count;
};
