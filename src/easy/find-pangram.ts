const alphabetic = (): string[] => "abcdefghijklmnopqrstuvwxyz".split("");

export const findPangram = (sentence: string): boolean => {
    if (sentence.length === 0) return false;
    return alphabetic()
        .map((curr) => new RegExp(curr, "i").test(sentence))
        .every((v) => v);
};
