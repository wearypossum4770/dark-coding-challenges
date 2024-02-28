import { describe, test, expect } from "bun:test";
import { nextGigasecond } from "~/easy/next-gigasecond";
describe("Adding a GigaSecond to a given time", () => {
    test.each([
        [
            new Date(Date.parse("2011-04-25")),
            new Date(Date.parse("2043-01-01T01:46:40Z")),
        ],
        [
            new Date(Date.parse("1977-06-13")),
            new Date(Date.parse("2009-02-19T01:46:40Z")),
        ],
        [
            new Date(Date.parse("1959-07-19")),
            new Date(Date.parse("1991-03-27T01:46:40Z")),
        ],
        [
            new Date(Date.parse("2015-01-24T22:00:00Z")),
            new Date(Date.parse("2046-10-02T23:46:40Z")),
        ],
        [
            new Date(Date.parse("2015-01-24T23:59:59Z")),
            new Date(Date.parse("2046-10-03T01:46:39Z")),
        ],
        [
            new Date(Date.parse("2015-01-24T23:59:59Z")),
            new Date(Date.parse("2046-10-03T01:46:39Z")),
        ],
    ])("the date %s after one gigasecond is %s ", (start, output) => {
        const result = nextGigasecond(start);
        expect(result).toStrictEqual(output);
    });
});
