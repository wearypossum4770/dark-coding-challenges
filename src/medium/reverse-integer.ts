export const reverseInteger = (x: number): number => {
    let num = 0;
    while (x != 0) {
        num = num * 10 + (x % 10);
        x = Math.trunc(x / 10);
    }
    if (num > 0x7fffffff || num < -0x80000000) return 0;
    return num;
};
