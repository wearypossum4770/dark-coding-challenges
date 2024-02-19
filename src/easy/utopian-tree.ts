const spring = (value: number): number => value * 2;
const summer = (value: number): number => value + 1;
/**
 * @copyright https://www.hackerrank.com/challenges/utopian-tree/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=30-day-campaign
 * @param years
 * @returns
 */
export const utopianTree = (years: number): number => {
    return [...Array(years + 1).keys()].reduce(
        (growth: number, year: number) => {
            if (year === 0) return growth;
            if (year % 2 === 0) return summer(growth);
            return spring(growth);
        },
        1,
    );
};
