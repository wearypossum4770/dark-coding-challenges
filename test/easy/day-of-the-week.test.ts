import { describe, test, expect } from "bun:test";
import { dayOfTheWeek } from "@/src/easy/day-of-the-week";
describe("dayOfTheWeek", () => {
    test.each([
        [31, 8, 2019, "Saturday"],
        [18, 7, 1999, "Sunday"],
        [15, 8, 1993, "Sunday"],
        [29, 2, 2016, "Monday"],
        [1, 1, 1971, "Friday"],
        [31, 12, 1971, "Friday"],
        [1, 1, 2100, "Friday"],
        [31, 12, 2100, "Friday"],
        [29, 2, 1972, "Tuesday"],
        [29, 2, 2000, "Tuesday"],
        [1, 3, 2100, "Monday"],
        [1, 3, 2020, "Sunday"],
        [31, 3, 2020, "Tuesday"],
        [28, 2, 2019, "Thursday"],
        [1, 3, 2019, "Friday"],
        [29, 2, 2020, "Saturday"],
        [1, 3, 2020, "Sunday"],
        [4, 7, 1976, "Sunday"],
        [1, 1, 2000, "Saturday"],
        [11, 9, 2001, "Tuesday"],
        [30, 12, 1999, "Thursday"],
        [31, 12, 1999, "Friday"],
        [1, 1, 2000, "Saturday"],
        [30, 4, 2021, "Friday"],
        [1, 5, 2021, "Saturday"],
        [2, 5, 2021, "Sunday"],
        [10, 10, 2010, "Sunday"],
        [14, 2, 2023, "Tuesday"],
        [25, 12, 1995, "Monday"],
    ])(
        "\n\tGiven: the date %i-%i-%i.\n\tThen: it falls on a %s",
        (day: number, month: number, year: number, output: string) => {
            const result = dayOfTheWeek(day, month, year);
            expect(result).toStrictEqual(output);
        },
    );
});
