import { orderChars } from "~/core";
export type StringArray = Array<string>;
export class Anagram {
    lowercased: string;
    compare: string;
    constructor(lowercased: string) {
        this.lowercased = lowercased.toLowerCase();
        this.compare = orderChars(this.lowercased);
    }
    public matches(...potentials: StringArray): StringArray {
        return potentials.reduce(
            (accumulator: StringArray, current: string) => {
                const lower = current.toLowerCase();
                if (this.lowercased === lower) return accumulator;
                if (this.compare === orderChars(lower))
                    return [...accumulator, current];
                return accumulator;
            },
            [],
        );
    }
}

export const findAnagram = (
    input: string,
    potentials: StringArray,
): StringArray => {
    const lowercased = input.toLowerCase();
    const compare = orderChars(lowercased);
    return potentials.reduce((accumulator: StringArray, current: string) => {
        const lower = current.toLowerCase();
        if (lowercased === lower) return accumulator;
        if (compare === orderChars(lower)) return [...accumulator, current];
        return accumulator;
    }, []);
};
