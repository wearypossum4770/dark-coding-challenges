export const toGoatLatin = (sentence: string): string => {
    return sentence.split(" ").reduce((acc, curr, i) => {
        const suffix = "a".repeat(i + 1);
        if (/[aeiou]/i.test(curr[0])) {
            return acc + `${curr}ma${suffix} `;
        }
        if (/^[^aeiou]/i.test(curr)) {
            return acc + curr.replace(
                /(^[^aeiou])(\w+)/i,
                (_, second, rest) => `${rest}${second}ma${suffix} `
            );
        }
        return acc;
    }, "").trim();
};