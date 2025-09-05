export const replaceGreatestElements = (arr: number[]): number[] => {
    let max = -1;
    let right = arr.length - 1;
    while (right >= 0) {
        const temp = arr[right];
        arr[right] = max;
        if (temp > max) {
            max = temp;
        }
        right--;
    }
    return arr;
};
