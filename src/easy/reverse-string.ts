export const reverseString = (word: string): string =>
    [...word].reduceRight((a, c) => a.concat(c), "");
