export const howManyWalls = (
    walls: number,
    width: number,
    height: number,
): number => {
    const total = width * height;
    if (total <= walls) {
        return Math.floor(walls / total);
    }
    return 0;
};
