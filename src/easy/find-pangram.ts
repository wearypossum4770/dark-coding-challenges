const alphaRegexes = (): Array<RegExp> => [
    /a/i,
    /b/i,
    /c/i,
    /d/i,
    /e/i,
    /f/i,
    /g/i,
    /h/i,
    /i/i,
    /j/i,
    /k/i,
    /l/i,
    /m/i,
    /n/i,
    /o/i,
    /p/i,
    /q/i,
    /r/i,
    /s/i,
    /t/i,
    /u/i,
    /v/i,
    /w/i,
    /x/i,
    /y/i,
    /z/i,
];

const alphabetic = (): Array<string> => "abcdefghijklmnopqrstuvwxyz".split("");

export const findPangram = (sentence: string): boolean => {
    if (sentence.length === 0) return false;
    return alphaRegexes()
        .map((curr) => curr.test(sentence))
        .every((v) => v);
};

export const hackerRankPangram = (sentence: string): string =>
    findPangram(sentence) ? "pangram" : "not pangram";

console.log(alphabetic());
