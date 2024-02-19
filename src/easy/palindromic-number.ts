export const palindromicNumber = (x: number): boolean => {
    if (x < 0) return false;
    const target = x.toString();
    return target === target.split("").reverse().join("");
};
