/**
 *
 * @param x coordinate for x value
 * @param y coordinate for y value.
 * @returns distance from the origin.
 */
const distanceFromOrigin = (x: number, y: number): number => {
    return distance(x, y, 0, 0);
};
/**
 *
 * @param x coordinate for x1 value
 * @param y coordinate for y1 value
 * @param a coordinate for x2 value
 * @param b coordinate for y2 value
 * @returns distance between
 */
const distance = (x: number, y: number, a: number, b: number): number => {
    const squaredX = Math.pow(a - x, 2);
    const squaredY = Math.pow(b - y, 2);
    return Math.sqrt(squaredX + squaredY);
};
export const dartScore = (x: number, y: number) => {
    const point = distanceFromOrigin(x, y);
    if (point <= 10 && point > 5) return 1;
    if (point <= 5 && point > 1) return 5;
    if (point <= 1) return 10;
    return 0;
};
