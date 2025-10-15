export const findWordsContaining = (words: string[], x: string) =>
    words.flatMap((a, i) => (a.includes(x) ? i : []), []);
