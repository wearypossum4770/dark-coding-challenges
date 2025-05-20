export const palindromeNumber = (x: number): boolean => {
    if (x < 0 || (x % 10 == 0 && x != 0)) return false;
    const num = x.toString();
    let right = num.length - 1;
    for (const left of num) {
        if (left !== num[right]) return false;
        right -= 1;
    }
    return true;
};
