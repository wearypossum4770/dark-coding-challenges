export const inchesToFeet = (inches: number): number =>
    inches < 12 ? 0 : Math.floor(inches / 12);
