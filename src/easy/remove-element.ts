export const removeElement = (arr: number[], target: number): number => {
    let result = 0;
    for (let num of arr) {
        if (num !== target) {
            arr[result] = num;
            result++;
        }
    }
    return result;
};
