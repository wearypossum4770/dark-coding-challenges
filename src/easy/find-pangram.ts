const alphabetic = (): string[] => "abcdefghijklmnopqrstuvwxyz".split("");

export const findPangram = (sentence: string): boolean => {
    const ascii = alphabetic().map((curr) =>
        new RegExp(curr, "i").test(sentence),
    );
    return ascii.length ? ascii.every((v) => v) : false;
};
