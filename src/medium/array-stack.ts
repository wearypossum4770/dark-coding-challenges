export const arrayStack = (target: number[], n: number): string[] => {
    const result: string[] = [];
    let counter = 1;
    let index = 0;
    while (index < target.length) {
        result.push("Push");
        if (target[index] === counter) {
            index++;
        } else {
            result.push("Pop");
        }
        counter++;
    }
    return result;
};
