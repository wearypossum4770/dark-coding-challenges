const offset = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];

const dayNames = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
];
export const dayOfTheWeek = (
    day: number,
    month: number,
    year: number,
): string => {
    const modifier = offset[month - 1];
    if (month < 3) {
        year -= 1;
    }
    const index =
        year +
        Math.trunc(year / 4) -
        Math.trunc(year / 100) +
        Math.trunc(year / 400) +
        modifier +
        day;
    return dayNames[index % 7];
};
